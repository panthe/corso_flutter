import 'package:flutter/material.dart';
import 'package:flutter_app_redux/redux/error/error_state.dart';

@immutable
class AppState {
  final ErrorState errorState;

  AppState({
    this.errorState
  });

  factory AppState.initial() {
    return AppState(
      errorState: ErrorState.initial()
    );
  }

  AppState copyWith({
    ErrorState errorState
  }) {
    return AppState(
      errorState: errorState
    );
  }
}