import 'package:flutter/material.dart';
import 'package:flutter_app_redux/redux/error/error_state.dart';
import 'package:flutter_app_redux/redux/user/user_state.dart';

@immutable
class AppState {
  final ErrorState errorState;
  final UserState userState;

  AppState({
    this.errorState,
    this.userState
  });

  factory AppState.initial() {
    return AppState(
      errorState: ErrorState.initial(),
      userState: UserState.initial()
    );
  }

  AppState copyWith({
    ErrorState errorState,
    UserState userState
  }) {
    return AppState(
      errorState: errorState,
      userState: userState
    );
  }
}