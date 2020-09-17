
import 'package:flutter/material.dart';
import 'package:flutter_app_design/global/keys.dart';
import 'package:flutter_app_design/models/dob.dart';
import 'package:flutter_app_design/models/name.dart';
import 'package:flutter_app_design/models/result.dart';
import 'package:flutter_app_design/models/top_level.dart';
import 'package:flutter_app_design/styles/styles.dart';

class UserCard extends StatelessWidget{
  final TopLevel topLevel;  
  
  UserCard({this.topLevel});

  _showErrorMessage() {
    Keys.scaffoldKey.currentState.showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text("${topLevel.error}"),
            duration: const Duration(minutes: 1),
            action: SnackBarAction(
              textColor: Colors.black,
              label: "OK",
              onPressed: () => Keys.scaffoldKey.currentState.hideCurrentSnackBar(),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    if (topLevel == null) {
      return SizedBox.shrink();
    } else if (topLevel.error != null) {
      _showErrorMessage();
      return SizedBox.shrink();
    }

    Result result = topLevel.results[0] ?? null;
    Name name = result?.name;
    Dob dob = result?.dob;

    String fullName = name == null ? "" : "${name.title} ${name.first} ${name.last}";
    String gender = result?.gender;
    String email = result?.email;
    int age = dob?.age;
    
    return Container(
      height: 180.0,
      width: 200.0,
      margin: const EdgeInsets.only(top:40.0),
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        bottom: 10.0
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            offset: Offset(1.1, 1.1),
            blurRadius: 10.0),
        ],
        color: Colors.orangeAccent.withOpacity(0.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0)
        ),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fullName,
            style: Styles.label
          ),
          Text(
            gender,
            style: Styles.label
          ),
          Text(
            email,
            style: Styles.label
          ),
          Text(
            age.toString(),
            style: Styles.label
          )
        ],
      )
    );
  }
}


