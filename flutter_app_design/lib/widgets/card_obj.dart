import 'package:flutter/material.dart';
import 'package:flutter_app_design/styles/styles.dart';

const double h = 150.0;
class CardObj extends StatelessWidget {
  final String title;
  final String subTitle;
  final String description;

  CardObj({this.title, this.subTitle, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: h,
        width: 200.0,
        padding: const EdgeInsets.only(top: 40.0, left: 20.0, bottom: 10.0),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0
            ),
          ],
          color: Colors.orangeAccent.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(h / 3),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
          ),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                title,
                style: Styles.title
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                subTitle,
                style: Styles.subTitle
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                description,
                style: Styles.description
              )
            ),
          ],
        )
    );
  }
}