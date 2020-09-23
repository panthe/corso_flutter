import 'package:flutter/material.dart';
import 'package:flutter_app_redux/config/keys.dart';
import 'package:flutter_app_redux/models/dob.dart';
import 'package:flutter_app_redux/models/name.dart';
import 'package:flutter_app_redux/models/picture.dart';
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
    Picture picture = result?.picture;

    String fullName = name == null ? "" : "${name.title} ${name.first} ${name.last}";
    String gender = result?.gender;
    String email = result?.email;
    int age = dob?.age;
    
    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
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
                      color: Colors.black.withOpacity(0.6),
                      offset: const Offset(0.0, 1.1),
                      blurRadius: 5.0
                  ),
                ],
                color: Colors.brown[400],
                borderRadius: const BorderRadius.all(
                    Radius.circular(5.0)
                ),
                border: Border.all(color: Colors.black),
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
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 10.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )

                ],
              )
          )
        ),
        Positioned(
          top: 10.0,
          right: -15.0,
          child: CircleAvatar(
            radius: 35.0,
            backgroundColor: gender == "female" ? Colors.pink : Colors.blue,
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(picture.thumbnail),
            ),
          ),
        )
      ],
    );
  }
}


