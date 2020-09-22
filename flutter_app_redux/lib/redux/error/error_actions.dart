import 'package:flutter/material.dart';

class SetError {
  final bool isShowing;
  final String code;
  final String description;

  SetError({
    @required this.isShowing,
    @required this.code,
    @required this.description,
  });
}

class DismissError {}

