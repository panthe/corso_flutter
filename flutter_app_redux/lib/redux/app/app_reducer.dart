import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    errorState: errorReducer(state.errorState, action)
  );
}