import 'dart:convert';

import 'package:flutter_app_redux/interfaces/with_error.dart';
import 'package:flutter_app_redux/models/info.dart';
import 'package:flutter_app_redux/models/result.dart';

class User extends WithError {
  User({
    this.results,
    this.info,
  });

  List<Result> results;
  Info info;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "info": info.toJson(),
  };
}