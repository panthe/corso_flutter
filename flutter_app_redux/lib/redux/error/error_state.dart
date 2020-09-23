import 'package:flutter/material.dart';

@immutable
class ErrorState {
  final bool isShowing;
  final String code;
  final String description;

  ErrorState({
    this.isShowing,
    this.code,
    this.description
  });

  ErrorState copyWith({
    bool isShowing,
    String code,
    String description
  }){
    return ErrorState(
      isShowing: isShowing ?? this.isShowing ,
      code: code ?? this.code ,
      description: description ?? this.description
    );
  }

  factory ErrorState.initial() {
    return ErrorState(
      isShowing: false,
      code: null,
      description: null
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorState &&
          runtimeType == other.runtimeType &&
          isShowing == other.isShowing &&
          code == other.code &&
          description == other.description;

  @override
  int get hashCode => isShowing.hashCode ^ code.hashCode ^ description.hashCode;

  static ErrorState fromJson(Map<String, dynamic> json) {


    return (json == null) ? ErrorState.initial() : ErrorState(
      isShowing: json["isShowing"],
      code: json["code"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
    'isShowing': this.isShowing,
    'code': this.code,
    'description': this.description,
  };
}