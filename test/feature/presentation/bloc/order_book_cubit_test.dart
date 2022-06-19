import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_dr/feature/domain/entity/order_book_response.dart';
import 'package:flutter_bloc_dr/feature/domain/repository/order_book_repository.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/order_book/order_book_cubit.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/order_book/order_book_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/order_cubit_data_helper.dart';

class MockOrderBookRepository extends Mock implements OrderBookRepository {}

class MockOrderBookCubit extends MockCubit<OrderBookState>
    implements OrderBookCubit {}

void main() {
  late OrderBookCubit orderBookCubit;
  late OrderBookRepository orderBookRepository;

  setUpAll(() {
    orderBookCubit = MockOrderBookCubit();
    orderBookRepository = MockOrderBookRepository();
  });

  group('Order book cubit test =>', () {
    test('Should fetch btcusd order book details.', () async {
      whenListen(
        orderBookCubit,
        Stream<OrderBookState>.fromIterable(
          <OrderBookState>[
            OrderBookInitState(),
            OrderBookLoadingState(),
            OrderBookLoadedState(orderBookResponse: orderBookResponseData),
          ],
        ),
      );

      await expectLater(
        orderBookCubit.stream,
        emitsInOrder(
          <dynamic>[
            isA<OrderBookInitState>(),
            isA<OrderBookLoadingState>(),
            isA<OrderBookLoadedState>(),
          ],
        ),
      );
      expect(orderBookCubit.state, isA<OrderBookLoadedState>());

      final OrderBookLoadedState currentState =
          orderBookCubit.state as OrderBookLoadedState;
      expect(currentState.orderBookResponse, isNotNull);
      expect(currentState.orderBookResponse, isA<OrderBookResponse>());
      expect(currentState.isLoading, isNotNull);
      expect(currentState.isLoading, isA<bool>());
    });

    final Exception exception = Exception('Order book exception.');

    blocTest<OrderBookCubit, OrderBookState>(
      'Captures exception for order book cubit test.',
      build: () => OrderBookCubit(orderBookRepository),
      act: (OrderBookCubit cubit) => cubit.addError(exception),
      errors: () => <Matcher>[equals(exception)],
    );
  });
}
