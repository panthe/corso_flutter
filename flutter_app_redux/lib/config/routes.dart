import 'package:flutter/material.dart';
import 'package:flutter_app_redux/anim/slide_from_bottom_page_route.dart';
import 'package:flutter_app_redux/ui/home_page.dart';
import 'package:flutter_app_redux/ui/second_page.dart';
import 'package:flutter_app_redux/ui/splash_page.dart';

class Routes {
  static const String homeRoute = 'home';
  static const String splashRoute = 'splash';
  static const String secondRoute = 'second';
  static const String compositeRoute = '/splash/home/second'; // TODO

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
          settings: settings
        );
        break;

      case homeRoute:
        return SlideFromBottomPageRoute(
            child: HomePage(),
            settings: settings
        );
        break;

      case secondRoute:
        return SlideFromBottomPageRoute(
          child: SecondPage(),
          settings: settings
        );
        break;

      default:
        return MaterialPageRoute(
            builder: (context) => HomePage(),
            settings: settings
        );
        break;
    }
  }
}


