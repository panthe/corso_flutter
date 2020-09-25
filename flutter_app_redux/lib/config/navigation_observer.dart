import 'package:flutter/material.dart';

class TestNavigatorObserver extends NavigatorObserver {
  final routeStack = <Route>[];

  String get topOfStackName => routeStack.isEmpty ? null : routeStack.first.settings.name;

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("Push ${route?.settings?.name} on ${previousRoute?.settings?.name}");
    routeStack.insert(0, route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("Pop ${route?.settings?.name} for ${previousRoute?.settings?.name}");
    routeStack.removeAt(0);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("Remove ${route?.settings?.name} and prev ${previousRoute?.settings?.name}");
    routeStack.removeAt(0);
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print("Replace ${oldRoute?.settings?.name} with ${newRoute?.settings?.name}");
    final index = routeStack.indexWhere(
      (route) => route.settings?.name == oldRoute.settings?.name);
    if (index >0) {
      routeStack.removeAt(index);
      routeStack.insert(index, newRoute);
    }
  }
}