import 'package:flutter/material.dart';
import 'package:flutter_app_redux/config/routes.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds:3),
        () => Navigator.pushReplacementNamed(
        context,
        HomeRoute
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text("Splash");
  }

}