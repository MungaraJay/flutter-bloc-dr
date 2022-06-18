import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/utils/app_color.dart';

class CurrencyDetailsRow extends StatelessWidget {
  const CurrencyDetailsRow(
      {required this.titleName, required this.data, Key? key})
      : super(key: key);

  final String titleName;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleName,
            style: const TextStyle(
                color: AppColor.greyTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w400)),
        const SizedBox(height: 4),
        Text(data,
            overflow: TextOverflow.clip,
            style: const TextStyle(
                color: AppColor.slightTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w900))
      ],
    );
  }
}
