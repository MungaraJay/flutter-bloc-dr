import 'package:flutter_bloc_dr/feature/domain/entity/order_book_response.dart';

abstract class OrderBookState {
  const OrderBookState({this.isLoading = false});

  final bool isLoading;
}

class OrderBookInitState extends OrderBookState {
  OrderBookInitState() : super();
}

class OrderBookLoadingState extends OrderBookState {
  OrderBookLoadingState() : super(isLoading: true);
}

class OrderBookLoadedState extends OrderBookState {
  final OrderBookResponse? orderBookResponse;

  OrderBookLoadedState({this.orderBookResponse}) : super();
}

class OrderBookErrorState extends OrderBookState {
  final String error;

  OrderBookErrorState({required this.error}) : super();
}
