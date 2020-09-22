import 'package:redux/redux.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_actions.dart';
import 'package:flutter_app_redux/redux/error/error_state.dart';

class ErrorViewModel {
  final Function dismissError;
  final ErrorState errorState;

  ErrorViewModel({this.dismissError, this.errorState});

  static ErrorViewModel fromStore(Store<AppState> store) {
    return ErrorViewModel(
      dismissError: () => store.dispatch(DismissError()),
      errorState: store.state.errorState
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorViewModel &&
          runtimeType == other.runtimeType &&
          dismissError == other.dismissError &&
          errorState == other.errorState;

  @override
  int get hashCode => dismissError.hashCode ^ errorState.hashCode;
}
