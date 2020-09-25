import 'package:flutter/material.dart';
import 'package:flutter_app_redux/config/routes.dart';
import 'package:flutter_app_redux/helpers/my_json_serialize.dart';
import 'package:flutter_app_redux/main.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

void main() {
  testWidgets('Navigation test', (WidgetTester tester) async {

    final persistor = Persistor<AppState>(
        storage: FlutterStorage(),
        serializer: MyJsonSerializer<AppState>(AppState.fromJson),
        debug: true,
        throttleDuration: const Duration(seconds: 2)
    );

    final Store<AppState> store = createStore(
        initialState: AppState.initial(),
        persistor: persistor
    );

    await tester.pumpWidget(MyApp(store: store));
    await tester.pump(const Duration(seconds:2));

    expect(MyApp.testNavigatorObserver.topOfStackName,Routes.splashRoute);



  });
}
