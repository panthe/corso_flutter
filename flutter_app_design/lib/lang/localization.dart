import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {
  final Locale locale;
  Map<String, String> _sentences;

  Localization({this.locale});

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  Future<bool> load() async {
    String data = await rootBundle.loadString("assets/lang/${this.locale.languageCode}.json");

    Map<String,dynamic> _result = json.decode(data);

    this._sentences = Map();

    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }

  String trans(String key) {
    return this._sentences[key];
  }
}