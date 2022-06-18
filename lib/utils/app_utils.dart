import 'package:connectivity_plus/connectivity_plus.dart';

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
}
