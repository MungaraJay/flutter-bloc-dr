import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/utils/app_color.dart';

class AppUtils {
  static Future<bool> isInternetConnected() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static void showSnackBar(BuildContext context, String message,
      {int duration = 1, SnackBarAction? action}) {
    final text = Text(message,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColor.whiteColor));

    final snackBar = SnackBar(
        content: text,
        backgroundColor: AppColor.snackBarColor,
        duration: Duration(seconds: duration),
        action: action,
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 50),
        behavior: SnackBarBehavior.floating);

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
