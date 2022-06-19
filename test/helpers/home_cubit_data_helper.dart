import 'package:flutter_bloc_dr/feature/domain/entity/crypto_currency_response.dart';

final CryptoCurrencyResponse cryptoCurrencyResponseData =
    CryptoCurrencyResponse(
        status: 200, message: '', cryptoCurrency: cryptoCurrency);

final CryptoCurrency cryptoCurrency = CryptoCurrency(
    high: '20000.00',
    last: '19748.80',
    timestamp: '1655641263',
    bid: '19734.62',
    vwap: '18637.96',
    volume: '7436.50750911',
    low: '17592.78',
    ask: '19755.96',
    open: '18952.14',
    currency: 'btcusd');
