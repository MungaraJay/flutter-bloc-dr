import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dr/feature/domain/repository/crypto_repository.dart';
import 'package:flutter_bloc_dr/feature/domain/repository/order_book_repository.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/crypto/crypto_cubit.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/crypto/crypto_state.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/order_book/order_book_cubit.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/order_book/order_book_state.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/presentation/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCryptoRepository extends Mock implements CryptoRepository {}

class MockOrderBookRepository extends Mock implements OrderBookRepository {}

class MockCryptoCubit extends MockCubit<CryptoState> implements CryptoCubit {}

class MockOrderBookCubit extends MockCubit<OrderBookState>
    implements OrderBookCubit {}

void main() {
  late CryptoCubit cryptoCubit;
  late OrderBookCubit orderBookCubit;

  late CryptoRepository cryptoRepository;
  late OrderBookRepository orderBookRepository;

  setUpAll(() {
    cryptoRepository = MockCryptoRepository();
    orderBookRepository = MockOrderBookRepository();

    cryptoCubit = CryptoCubit(cryptoRepository);
    orderBookCubit = OrderBookCubit(orderBookRepository);
  });

  group('Home Screen widget tests', () {
    testWidgets('Should render home UI.', (WidgetTester tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<CryptoCubit>(create: (_) => cryptoCubit),
          BlocProvider<OrderBookCubit>(create: (_) => orderBookCubit),
        ],
        child: const _TestWidget(child: HomeScreen()),
      ));
      await tester.idle();
      await tester.pump();

      expect(find.byType(Scaffold), findsNWidgets(2));
    });
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(home: child);
}
