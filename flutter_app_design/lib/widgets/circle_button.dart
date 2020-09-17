import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Function callback;

  CircleButton({this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        width: 50.0,
        child: MaterialButton(
          color: Colors.white.withOpacity(0.6),
          shape: CircleBorder(
              side: BorderSide(
                  width: 2.0,
                  color: Colors.white,
                  style: BorderStyle.solid
              )
          ),
          child: Icon(Icons.search),
          onPressed: () => callback(),
        )
    );
  }
}