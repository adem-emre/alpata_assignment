import 'package:dio/dio.dart';

String checkAndReturnErrorMessage(DioError e) {
  if (e.message.contains("SocketException")) {
    return "Lütfen internet bağlantınızı kontrol edin";
  } else if (e.response != null &&
      (e.response!.data as Map<String, dynamic>).containsKey("Message")) {
    return e.response!.data["Message"];
  }
  return e.message.toString();
}
