import 'package:dio/dio.dart';

class HelperDio {
  static String resolveDioError(DioError dioError) {
    try {
      if (dioError.response.data != null) {
        return dioError.response.data["message"];
      }
      return "Generic Error";
    } catch (e) {
      return "(Dio) Unhandled Exception $e";
    }
  }
}