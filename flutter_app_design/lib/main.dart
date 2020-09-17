import 'package:flutter/material.dart';
import 'package:flutter_app_design/ui/home_page.dart';

import 'package:flutter_app_design/global/keys.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
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

