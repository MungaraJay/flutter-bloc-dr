class OrderBookResponse {
  int? status;
  String? message;
  OrderBookModel? orderBookModel;

  OrderBookResponse({this.status, this.message, this.orderBookModel});

  OrderBookResponse.fromJson(dynamic json,
      {required int statusCode, required String msg}) {
    orderBookModel = json != null ? OrderBookModel.fromJson(json) : null;
    message = msg;
    status = statusCode;
  }
}

class OrderBookModel {
  OrderBookModel({
    this.timestamp,
    this.microtimestamp,
    this.bids,
    this.asks,
  });

  OrderBookModel.fromJson(dynamic json) {
    bids = [];
    if (json['bids'] != null && json['bids'].length > 0) {
      json['bids'].forEach((element) {
        List<String> list = [];
        element.forEach((x) {
          list.add(x);
        });
        bids?.add(list);
      });
    }

    asks = [];
    if (json['asks'] != null && json['asks'].length > 0) {
      json['asks'].forEach((element) {
        List<String> list = [];
        element.forEach((x) {
          list.add(x);
        });
        asks?.add(list);
      });
    }
    timestamp = json['timestamp'];
    microtimestamp = json['microtimestamp'];
  }
  String? timestamp;
  String? microtimestamp;
  List<List<String>>? bids;
  List<List<String>>? asks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = timestamp;
    map['microtimestamp'] = microtimestamp;
    map['bids'] = bids;
    map['asks'] = asks;
    return map;
  }
}
