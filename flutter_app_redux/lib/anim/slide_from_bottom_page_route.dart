import 'package:flutter/material.dart';
import 'package:flutter_app_redux/config/routes.dart';

class SlideFromBottomPageRoute<T> extends PageRoute<T> {
  Widget child;

  SlideFromBottomPageRoute({this.child, RouteSettings settings}) : super(settings: settings);

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final Tween<Offset> tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
    final Animation<Offset> slideAnimation = tween.animate(animation);

    return SlideTransition(
      position: slideAnimation,
      child: RotationTransition(
        turns: secondaryAnimation,
        child: child,
      ),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

}