import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/utils/app_color.dart';

class OrderBookItemRow extends StatelessWidget {
  const OrderBookItemRow({required this.item, Key? key}) : super(key: key);

  final List<String> item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 3,
              child: Text(item.first,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppColor.greyTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))),
          const SizedBox(width: 4),
          Expanded(
              flex: 4,
              child: Text(item.last,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppColor.greyTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))),
          const SizedBox(width: 8),
          Expanded(
              flex: 4,
              child: Text(item.last,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppColor.greyTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))),
          const SizedBox(width: 4),
          Expanded(
              flex: 3,
              child: Text(item.first,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppColor.greyTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400)))
        ],
      ),
    );
  }
}
