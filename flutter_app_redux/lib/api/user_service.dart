import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_redux/helpers/helper_dio.dart';
import 'package:flutter_app_redux/models/user.dart';

class UserService {

  static Future<User> getRandomUser() async {
    String url = "https://randomuser.me/api/";

    User res = User();

    try {
      Dio dio = Dio();
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        res = User.fromJson(response.data);
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