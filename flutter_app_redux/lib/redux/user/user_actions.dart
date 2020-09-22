import 'package:flutter/material.dart';
import 'package:flutter_app_redux/models/user.dart';

class FetchingUser {
  final bool isLoading;
  
  FetchingUser({
    @required this.isLoading  
  });
}

class FetchUser {}

class SetUser {
  final User user;

  SetUser({
    @required this.user,
  });
}

class ResetUser {}

