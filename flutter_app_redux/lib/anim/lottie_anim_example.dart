import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimExample extends StatefulWidget {
  final bool runAnimation;
  final Function callback;

  LottieAnimExample({Key key, this.runAnimation, this.callback}): super(key: key);

  @override
  _LottieAnimExampleState createState() => _LottieAnimExampleState();
}

class _LottieAnimExampleState extends State<LottieAnimExample> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("Lottie Animation Completed");
        widget.callback();
        _animationController.reset();
      }
    });
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  void didUpdateWidget(LottieAnimExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.runAnimation) {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 150.0,
      child: Lottie.asset(
        'assets/anim/lottie-animation.json',
        controller: _animationController,
        onLoaded: (composition) {
          _animationController.duration = composition.duration;
        }
      ),
    );
  }

}