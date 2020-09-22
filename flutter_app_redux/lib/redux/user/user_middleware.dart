
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_actions.dart';
import 'package:flutter_app_redux/config/keys.dart';


Middleware<AppState> createUserMiddleware() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {

    if (action is ShowUser) {
      print("Action ShowUser");

      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("${action.code} - ${action.description}"),
          duration: const Duration(seconds: 30),
          action: SnackBarAction(
            textColor: Colors.black,
            label: "OK",
            onPressed: () => store.dispatch(DismissUser()),
          )
        )
      );

    }

    if (action is DismissUser) {
      print("Action DismissUser");
      scaffoldKey.currentState.hideCurrentSnackBar();
    }

    next(action);
  };
}

