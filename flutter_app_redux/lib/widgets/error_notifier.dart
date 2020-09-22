import 'package:flutter/material.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_vm.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ErrorNotifier extends StatelessWidget {
  final Widget child;

  ErrorNotifier({this.child});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ErrorViewModel>(
      distinct: true,
      converter: (store) => ErrorViewModel.fromStore(store),
      builder: (context, vm) => child,
      onWillChange: (s1,s2) {
        if (s2.errorState.isShowing) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 30),
              content: Text("${s2.errorState.code} - ${s2.errorState.description}"),
              action: SnackBarAction(
                textColor: Colors.black,
                label: "OK",
                onPressed: () => {},
              )
            )
          ).closed.then((value) => s2.dismissError());
        }
      },
    );
  }
}
