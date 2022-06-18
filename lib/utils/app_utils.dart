import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/utils/app_color.dart';
import 'package:flutter_bloc_dr/utils/app_constant.dart';
import 'package:intl/intl.dart';

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
        style: const TextStyle(
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

  static String getDateFormattedInString(int timeStamp) {
    try {
      return DateFormat(AppConstant.appDateFormat)
          .format(DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000));
    } catch (e) {
      return '';
    }
  }
}
