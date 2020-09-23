import 'package:flutter/material.dart';
import 'package:flutter_app_redux/models/user.dart';
import 'package:flutter_app_redux/redux/user/user_actions.dart';
import 'package:flutter_app_redux/redux/user/user_state.dart';
import 'package:flutter_app_redux/widgets/user_card.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app_redux/config/routes.dart';
import 'package:flutter_app_redux/config/keys.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_actions.dart';

class SecondPage extends StatelessWidget {
  final store = StoreProvider.of<AppState>(scaffoldKey.currentContext);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.6),
        border: Border.all(
          color: Colors.white,
          width: 1.0
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Text("Seconda Pagina")
    );
  }
}