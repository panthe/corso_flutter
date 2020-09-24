import 'package:flutter/material.dart';
import 'package:flutter_app_redux/anim/slide_from_bottom_page_route.dart';
import 'package:flutter_app_redux/ui/form_page.dart';
import 'package:flutter_app_redux/ui/grid_page.dart';
import 'package:flutter_app_redux/ui/home_page.dart';
import 'package:flutter_app_redux/ui/list_page.dart';
import 'package:flutter_app_redux/ui/second_page.dart';
import 'package:flutter_app_redux/ui/splash_page.dart';

class Routes {
  static const String homeRoute = 'home';
  static const String splashRoute = 'splash';
  static const String secondRoute = 'second';
  static const String formRoute = 'form';
  static const String listRoute = 'list';
  static const String gridRoute = 'grid';

  static const String compositeRoute = '/$homeRoute/$secondRoute';

  static const String nestedRoute = '/$homeRoute/$secondRoute/$listRoute';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
          settings: settings
        );

      case "/":
      case homeRoute:
        return SlideFromBottomPageRoute(
            child: HomePage(),
            settings: settings
        );

      case secondRoute:
        return SlideFromBottomPageRoute(
          child: SecondPage(),
          settings: settings
        );

      case formRoute:
        return SlideFromBottomPageRoute(
            child: FormPage(),
            settings: settings
        );

      case listRoute:
        return SlideFromBottomPageRoute(
            child: ListPage(),
            settings: settings
        );

      case gridRoute:
        return SlideFromBottomPageRoute(
            child: GridPage(),
            settings: settings
        );

      case compositeRoute:
        return SlideFromBottomPageRoute(
            child: SecondPage(),
            settings: settings
        );

      case nestedRoute:
        return SlideFromBottomPageRoute(
            child: ListPage(),
            settings: settings
        );

      default:
        return MaterialPageRoute(
            builder: (context) => HomePage(),
            settings: settings
        );
    }
  }
}


