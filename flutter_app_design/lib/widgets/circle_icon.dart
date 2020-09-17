import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final String iconPath;

  CircleIcon({this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            offset: const Offset(1.1, 1.1),
            blurRadius: 10.0
          ),
        ],
        color: Colors.white.withOpacity(0.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2)
        ),
      ),
      child: Image(
        image: AssetImage(iconPath),
        fit: BoxFit.cover,
      )
    );
  }
}