import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_reducer.dart';
import 'package:flutter_app_redux/redux/user/user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    errorState: errorReducer(state.errorState, action),
    userState: userReducer(state.userState, action),
  );
}