import 'package:flutter_bloc_dr/config/enums.dart';

class ApiConstant {
  static String get baseDomain => 'https://www.bitstamp.net/api';
  static String get apiVersion => '/v2/';

  static String getValue(ApiType type) {
    switch (type) {
      case ApiType.fetchCryptoCurrency:
        return 'ticker/';
      case ApiType.fetchCryptoOrderBook:
        return 'order_book/';
      default:
        return '';
    }
  }
}
