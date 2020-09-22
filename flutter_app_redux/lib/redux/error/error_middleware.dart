
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_actions.dart';
import 'package:flutter_app_redux/config/keys.dart';


Middleware<AppState> createErrorMiddleware() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {

    next(action);
  };
}

