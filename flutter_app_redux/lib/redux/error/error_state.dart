import 'package:flutter/material.dart';

@immutable
class ErrorState {
  final String code;
  final String description;

  ErrorState({
    this.code,
    this.description
  });

  ErrorState copyWith({
    String errorCode,
    String errorDescription
  }){
    return ErrorState(
      code: errorCode ?? code ,
      description: errorDescription ?? description
    );
  }

  factory ErrorState.initial() {
    return ErrorState(
        code: null,
        description: null
    );
  }
}