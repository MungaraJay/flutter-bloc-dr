import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/utils/app_color.dart';

class OrderBookItemTitle extends StatelessWidget {
  const OrderBookItemTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Expanded(
            flex: 3,
            child: Text("BID PRICE",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColor.greyTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500))),
        SizedBox(width: 4),
        Expanded(
            flex: 4,
            child: Text("QTY",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColor.greyTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500))),
        SizedBox(width: 8),
        Expanded(
            flex: 4,
            child: Text("QTY",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColor.greyTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500))),
        SizedBox(width: 4),
        Expanded(
            flex: 3,
            child: Text("ASK PRICE",
                maxLines: 1,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColor.greyTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)))
      ],
    );
  }
}
