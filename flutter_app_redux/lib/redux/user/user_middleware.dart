import 'package:redux/redux.dart';
import 'package:flutter_app_redux/api/user_service.dart';
import 'package:flutter_app_redux/models/user.dart';
import 'package:flutter_app_redux/redux/error/error_actions.dart';
import 'package:flutter_app_redux/redux/user/user_actions.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';

Middleware<AppState> createUserMiddleware() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {

    if (action is FetchUser) {
      print("Action FetchUser");

      // Cambio stato isLoading
      store.dispatch(FetchingUser(isLoading: true));

      try {
        //Fetch dei dati
        User user = await UserService.getRandomUser();

        // Check dei dati, se i dati ci sono -> SetUser
        if (user.error == null) {
          store.dispatch(SetUser(user: user));
        } else {
          store.dispatch(SetError(isShowing: true, code: "US002", description: user.error));
        }

      } catch (e) {
        // ShowError
        store.dispatch(SetError(isShowing: true, code: "US001", description: e.toString()));
      } finally {
        // Cambio stato isLoading
        store.dispatch(FetchingUser(isLoading: false));
      }
    }

    next(action);
  };
}

