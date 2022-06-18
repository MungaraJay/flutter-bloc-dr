import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dr/feature/domain/entity/order_book_response.dart';
import 'package:flutter_bloc_dr/feature/domain/repository/order_book_repository.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/order_book/order_book_state.dart';

class OrderBookCubit extends Cubit<OrderBookState> {
  final OrderBookRepository _orderBookRepository;

  OrderBookCubit(this._orderBookRepository) : super(OrderBookInitState());

  Future<void> fetchOrderBook(String currency) async {
    try {
      emit(OrderBookLoadingState());
      OrderBookResponse cryptoCurrencyResponse =
          await _orderBookRepository.fetchOrderBook(currency: currency);

      emit(OrderBookLoadedState(orderBookResponse: cryptoCurrencyResponse));
    } catch (e) {
      emit(OrderBookErrorState(error: e.toString()));
    }
  }

  Future<void> toggleOrderBook() async {
    emit(OrderBookLoadedState());
  }
}
