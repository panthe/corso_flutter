import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/lang/localization.dart';

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['it','en'].contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) async {
    Localization localization = Localization(locale: locale);

    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) {
    return false; // Todo
  }
}