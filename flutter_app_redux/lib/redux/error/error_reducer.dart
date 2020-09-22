import 'package:redux/redux.dart';
import 'package:flutter_app_redux/redux/error/error_state.dart';
import 'package:flutter_app_redux/redux/error/error_actions.dart';

final errorReducer = combineReducers<ErrorState>(
  [
    TypedReducer<ErrorState, ShowError> (_showing),
    TypedReducer<ErrorState, DismissError> (_dismiss),
  ]
);

ErrorState _showing(ErrorState state, ShowError action) {
  return state.copyWith(
    errorCode: action.code,
    errorDescription: action.description
  );
}

ErrorState _dismiss(ErrorState state, DismissError action) {
  return ErrorState.initial();
}

