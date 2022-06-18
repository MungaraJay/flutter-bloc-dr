class CryptoCurrencyResponse {
  int? status;
  String? message;
  CryptoCurrency? cryptoCurrency;

  CryptoCurrencyResponse({this.status, this.message, this.cryptoCurrency});

  CryptoCurrencyResponse.fromJson(dynamic json,
      {required int statusCode, required String msg, required String val}) {
    cryptoCurrency = json != null ? CryptoCurrency.fromJson(json, val) : null;
    message = msg;
    status = statusCode;
  }
}

class CryptoCurrency {
  CryptoCurrency({
    this.high,
    this.last,
    this.timestamp,
    this.bid,
    this.vwap,
    this.volume,
    this.low,
    this.ask,
    this.open,
  });

  CryptoCurrency.fromJson(dynamic json, String val) {
    high = json['high'];
    last = json['last'];
    timestamp = json['timestamp'];
    bid = json['bid'];
    vwap = json['vwap'];
    volume = json['volume'];
    low = json['low'];
    ask = json['ask'];
    open = json['open'];
    currency = val;
  }

  String? high;
  String? last;
  String? timestamp;
  String? bid;
  String? vwap;
  String? volume;
  String? low;
  String? ask;
  String? open;
  String? currency;
}
