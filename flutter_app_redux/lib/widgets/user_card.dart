
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/config/keys.dart';
import 'package:flutter_app_redux/models/dob.dart';
import 'package:flutter_app_redux/models/name.dart';
import 'package:flutter_app_redux/models/result.dart';
import 'package:flutter_app_redux/models/user.dart';
import 'package:flutter_app_redux/styles/styles.dart';

class UserCard extends StatelessWidget{
  final User user;
  
  UserCard({this.user});


  @override
  Widget build(BuildContext context) {
    if (user == null || user.error != null) {
      return SizedBox.shrink();
    }

    Result result = user.results[0] ?? null;
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


