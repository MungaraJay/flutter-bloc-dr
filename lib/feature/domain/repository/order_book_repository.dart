import 'package:flutter_bloc_dr/config/enums.dart';
import 'package:flutter_bloc_dr/core/base/base_repository.dart';
import 'package:flutter_bloc_dr/core/base/base_response.dart';
import 'package:flutter_bloc_dr/feature/domain/entity/order_book_response.dart';

class OrderBookRepository extends BaseRepository {
  Future<OrderBookResponse> fetchOrderBook({required String currency}) async {
    BaseResponse apiResponse =
        await callGETMethod(ApiType.fetchCryptoOrderBook, urlParam: currency);
    return OrderBookResponse.fromJson(apiResponse.json,
        msg: apiResponse.errMessage, statusCode: apiResponse.status);
  }
}
