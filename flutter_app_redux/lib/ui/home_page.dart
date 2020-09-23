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
      child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(25.0),
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20.0),
                child: StoreConnector<AppState,UserState>(
                    distinct: true,
                    converter: (store) => store.state.userState,
                    builder: (context, userState) {
                      bool isLoading = userState.isLoading;
                      User user = userState.user;

                      return isLoading ? Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellowAccent)
                          )
                      ) : UserCard(user: user);
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Colors.black,
                        width: 2.0
                      )
                    ),
                    onPressed: () => { store.dispatch(FetchUser()) },
                    color: Colors.yellow,
                    child: Text("Fetch User"),
                  )
              )
            ],
          )
      )
    );
  }

}