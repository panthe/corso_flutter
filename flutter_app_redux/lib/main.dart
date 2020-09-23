import 'package:flutter/material.dart';
import 'package:flutter_app_redux/widgets/error_notifier.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app_redux/redux/store.dart';
import 'package:flutter_app_redux/config/keys.dart';
import 'package:flutter_app_redux/config/routes.dart';
import 'package:flutter_app_redux/ui/home_page.dart';
import 'package:flutter_app_redux/ui/splash_page.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final Store<AppState> store = createStore();

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState> (
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo Redux',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.transparent,
        ),
        initialRoute: SplashRoute,
        routes: {
          HomeRoute: (context) => HomePage(),
          SplashRoute: (context) => SplashPage(),
        },
        builder: (context, child) {
          return Scaffold(
            key: scaffoldKey,
            appBar: null,
            body: SafeArea(
              child: ErrorNotifier(
                child: child
              ),
            ),
          );
        },
      )
    );
  }
}
