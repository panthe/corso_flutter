import 'dart:convert';

import 'package:flutter_app_design/interfaces/with_error.dart';
import 'package:flutter_app_design/models/info.dart';
import 'package:flutter_app_design/models/result.dart';

class TopLevel extends WithError {
  TopLevel({
    this.results,
    this.info,
  });

  List<Result> results;
  Info info;

  factory TopLevel.fromRawJson(String str) => TopLevel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopLevel.fromJson(Map<String, dynamic> json) => TopLevel(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "info": info.toJson(),
  };
}