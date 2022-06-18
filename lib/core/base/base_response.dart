class BaseResponse {
  int status;
  String errMessage;
  dynamic json;

  BaseResponse({
    required this.status,
    required this.errMessage,
    this.json,
  });
}
