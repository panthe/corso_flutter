import 'package:flutter/material.dart';
import 'package:flutter_app_redux/helpers/my_json_serialize.dart';
import 'package:flutter_app_redux/widgets/error_notifier.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app_redux/redux/store.dart';
import 'package:flutter_app_redux/config/keys.dart';
import 'package:flutter_app_redux/config/routes.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'config/navigation_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: MyJsonSerializer<AppState>(AppState.fromJson),
    debug: true,
    throttleDuration: const Duration(seconds: 2)
  );

  final AppState initialState = await persistor.load();

  final Store<AppState> store = createStore(
    initialState: initialState,
    persistor: persistor
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  static final testNavigatorObserver = TestNavigatorObserver();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState> (
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo Redux',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.transparent,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder()
          })
        ),
        initialRoute: Routes.splashRoute,
        onGenerateRoute: Routes.onGenerateRoute,
        navigatorKey: navigatorKey,
        navigatorObservers: [testNavigatorObserver],
        builder: (context, child) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: Text("Redux App"),
              actions: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (navigatorKey.currentState.canPop())
                      navigatorKey.currentState.pop();
                  },
                )
              ]
            ),
            body: SafeArea(
              child: ErrorNotifier(
                child: child
              ),
            ),
          );
        },
      )
    );
  }
}
