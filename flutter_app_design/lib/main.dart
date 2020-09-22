import 'package:flutter/material.dart';
import 'package:flutter_app_design/ui/home_page.dart';
import 'package:flutter_app_design/global/keys.dart';

// Languages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app_design/lang/localization.dart';
import 'package:flutter_app_design/lang/localization_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      onGenerateTitle: (context) => Localization.of(context).trans("title"),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      supportedLocales: [
        const Locale('en','US'),
        const Locale('it','IT'),
      ],
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const LocalizationDelegate()
      ],
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
          supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.last;
      },
      home: Scaffold(
        key: Keys.scaffoldKey,
        appBar: AppBar(
          title: Text("Flutter Design test"),
        ),
        body: SafeArea(
          child: HomePage(),
        )
      ),
    );
  }
}

