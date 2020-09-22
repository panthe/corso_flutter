import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/app/app_reducer.dart';
import 'package:flutter_app_redux/redux/error/error_middleware.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
      ..add(createErrorMiddleware())
      ..add(LoggingMiddleware.printer())
  );
}