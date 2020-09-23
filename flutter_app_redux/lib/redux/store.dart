import 'package:flutter_app_redux/redux/user/user_middleware.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/app/app_reducer.dart';
import 'package:flutter_app_redux/redux/error/error_middleware.dart';
import 'package:redux_persist/redux_persist.dart';

Store<AppState> createStore({AppState initialState, Persistor<AppState> persistor}) {
  return Store(
    appReducer,
    initialState: initialState ?? AppState.initial(),
    middleware: []
      ..add(createErrorMiddleware())
      ..add(createUserMiddleware())
      ..add(persistor.createMiddleware())
      ..add(LoggingMiddleware.printer())
  );
}