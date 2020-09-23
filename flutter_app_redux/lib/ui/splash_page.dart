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
      const Duration(seconds:8),
        () => Navigator.pushReplacementNamed(
        context,
        Routes.homeRoute
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.white,
              Colors.grey,
              Colors.black
            ]
          )
      ),
      child: Center(
        child: Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 3.0
            )
          ),
          child: Center(
            child: Text(
              "Redux\nDemo",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          )
        ),
      ),
    );
  }

}