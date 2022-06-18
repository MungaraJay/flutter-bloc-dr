import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_dr/core/base/base_response.dart';
import 'package:flutter_bloc_dr/utils/app_utils.dart';

class ApiService {
  factory ApiService() {
    return _singleton;
  }

  final Dio dio = Dio();
  static final ApiService _singleton = ApiService._internal();

  ApiService._internal() {
    dio.options.connectTimeout = 60 * 1000;
    dio.options.receiveTimeout = 60 * 1000;
  }

  Future<BaseResponse> callGETMethod(String url) async {
    try {
      if (!await AppUtils.isInternetConnected()) {
        return BaseResponse(status: 500, errMessage: 'Internet not connected.');
      }
      Response response = await dio.get(url);

      return BaseResponse(
          status: response.statusCode ?? 400,
          errMessage: '',
          json: response.data);
    } on DioError catch (e) {
      return BaseResponse(
          status: e.response?.statusCode ?? 400, errMessage: e.message);
    } on SocketException {
      return BaseResponse(status: 500, errMessage: 'Internet not connected.');
    } catch (e) {
      return BaseResponse(
          status: 400, errMessage: 'Something went wrong. please try again.');
    }
  }
}
