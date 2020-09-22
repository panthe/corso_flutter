import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app_redux/config/routes.dart';
import 'package:flutter_app_redux/config/keys.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_actions.dart';

class HomePage extends StatelessWidget {
  final store = StoreProvider.of<AppState>(scaffoldKey.currentContext);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 50.0,
            width: 100.0,
            child: MaterialButton(
              height: 36.0,
              minWidth: 80.0,
              padding: EdgeInsets.all(5.0),
              onPressed: () => { store.dispatch(ShowError(code: "001", description: "Errore Desc")) },
              color: Colors.yellow,
              child: Text("Home"),
            )
          )
        ],
      )
    );
  }
}