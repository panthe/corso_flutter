import 'package:flutter/material.dart';

class FadeAnimExample extends StatefulWidget {
  final bool runAnimation;
  final Function callback;
  
  FadeAnimExample({Key key, this.runAnimation, this.callback}): super(key: key);
  
  @override
  _FadeAnimExampleState createState() => _FadeAnimExampleState();
}

class _FadeAnimExampleState extends State<FadeAnimExample> with SingleTickerProviderStateMixin{  
  AnimationController _animationController;
  Animation<double> _fadeAnim;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this
    );
    
    _animationController.addStatusListener((status) { 
      if (status == AnimationStatus.completed) {
        print("Fade Animation Completed");
        widget.callback();
        _animationController.reset();
      }
    });

    _fadeAnim = Tween(
        begin: 1.0,
        end: 0.0
    ).animate(
        _animationController
    );
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  void didUpdateWidget(FadeAnimExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.runAnimation) {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _fadeAnim,
        child: createContainer()
    );                  
  }

  Widget createContainer() {
    return Container(
      height: 50.0,
      width: 50.0,
      color: Colors.pink,
    );
  }
}