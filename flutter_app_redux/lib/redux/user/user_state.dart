import 'package:flutter/material.dart';
import 'package:flutter_app_redux/models/user.dart';

@immutable
class UserState {
  final bool isLoading;
  final User user;

  UserState({
    this.isLoading,
    this.user
  });

  UserState copyWith({
    bool isLoading,
    User user
  }){
    return UserState(
      isLoading: isLoading ?? this.isLoading ,
      user: user ?? this.user
    );
  }

  factory UserState.initial() {
    return UserState(
        isLoading: false,
        user: null
    );
  }
}