import 'package:flutter_bloc_dr/feature/domain/entity/order_book_response.dart';

final OrderBookResponse orderBookResponseData =
    OrderBookResponse(status: 200, message: '', orderBookModel: orderBookModel);

final OrderBookModel orderBookModel = OrderBookModel(
  microtimestamp: '1655641816913111',
  timestamp: '1655641816',
  asks: [
    ["19455.17", "0.10395050"],
    ["19464.02", "0.76654852"],
    ["19464.03", "0.56234569"],
    ["19469.63", "0.06093000"],
    ["19469.64", "0.16427898"],
    ["19469.65", "0.74059561"],
    ["19469.66", "0.31492947"],
    ["19473.25", "1.10745712"],
  ],
  bids: [
    ["19436.42", "0.02000000"],
    ["19436.41", "0.18877964"],
    ["19431.63", "0.74481507"],
    ["19428.68", "0.54219372"],
    ["19428.67", "1.10286487"],
    ["19428.49", "0.01721990"],
    ["19425.35", "0.22686562"],
    ["19423.80", "0.76062036"],
  ],
);
