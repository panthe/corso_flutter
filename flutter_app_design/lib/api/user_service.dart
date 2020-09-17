import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_design/helpers/helper_dio.dart';
import 'package:flutter_app_design/models/top_level.dart';

class UserService {

  static Future<TopLevel> getRandomUser() async {
    String url = "https://randomuser.me/api/";

    TopLevel res = TopLevel();

    try {
      Dio dio = Dio();
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        res = TopLevel.fromJson(response.data);
      }

      return res;
    } on DioError catch (e) {
      res.error = HelperDio.resolveDioError(e);
      return res;
    } catch (e) {
      res.error = "Unhandled Exception $e";
      return res;
    }
  }
}