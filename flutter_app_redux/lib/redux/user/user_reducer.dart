import 'package:redux/redux.dart';
import 'package:flutter_app_redux/redux/user/user_actions.dart';
import 'package:flutter_app_redux/redux/user/user_state.dart';

final userReducer = combineReducers<UserState>(
  [
    TypedReducer<UserState, FetchingUser> (_fetching),
    TypedReducer<UserState, SetUser> (_setting),
    TypedReducer<UserState, ResetUser> (_reset),
  ]
);

UserState _fetching(UserState state, FetchingUser action) {
  return state.copyWith(
      isLoading: action.isLoading,
  );
}

UserState _setting(UserState state, SetUser action) {
  return state.copyWith(
    user: action.user,
  );
}

UserState _reset(UserState state, ResetUser action) {
  return UserState.initial();
}

