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

class HomePage extends StatelessWidget {
  final store = StoreProvider.of<AppState>(scaffoldKey.currentContext);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: StoreConnector<AppState,UserState>(
              distinct: true,
              converter: (store) => store.state.userState,
              builder: (context, userState) {
                bool isLoading = userState.isLoading;
                User user = userState.user;

                return isLoading ? CircularProgressIndicator() : UserCard(user: user);
              }
            ),
          ),
          Container(
            height: 50.0,
            width: 100.0,
            child: MaterialButton(
              height: 36.0,
              minWidth: 80.0,
              padding: const EdgeInsets.all(5.0),
              onPressed: () => { store.dispatch(FetchUser()) },
              color: Colors.yellow,
              child: Text("Fetch User"),
            )
          )
        ],
      )
    );
  }

}