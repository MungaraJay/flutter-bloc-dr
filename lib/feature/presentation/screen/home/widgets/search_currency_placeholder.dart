import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/utils/app_color.dart';
import 'package:flutter_bloc_dr/utils/app_image.dart';

class SearchCurrencyPlaceholder extends StatelessWidget {
  const SearchCurrencyPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        const SizedBox(height: 60),
        Image.asset(AppImage.imgSearch,
            height: 150, width: 150, color: AppColor.searchGreyColor),
        const SizedBox(height: 40),
        const Text("Enter a currency pair to load data",
            style: TextStyle(
                fontSize: 16,
                color: AppColor.lightTextColor,
                fontWeight: FontWeight.w500)),
      ],
    ));
  }
}
