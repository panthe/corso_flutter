import 'package:flutter/material.dart';
import 'package:flutter_app_design/api/user_service.dart';
import 'package:flutter_app_design/global/keys.dart';
import 'package:flutter_app_design/lang/localization.dart';
import 'package:flutter_app_design/models/top_level.dart';
import 'package:flutter_app_design/widgets/card_obj.dart';
import 'package:flutter_app_design/widgets/circle_button.dart';
import 'package:flutter_app_design/widgets/circle_icon.dart';
import 'package:flutter_app_design/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TopLevel _topLevel;

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          _presentationCard(),
          UserCard(topLevel: _topLevel)
        ],
      )
    );
  }

  _callGetRandomUser() async {
    TopLevel res = await UserService.getRandomUser();
    setState(() {
      _topLevel = res;
    });
  }

  Widget _presentationCard() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        CardObj(
          title: Localization.of(Keys.scaffoldKey.currentContext).trans("title"),
          subTitle: Localization.of(Keys.scaffoldKey.currentContext).trans("subTitle"),
          description: Localization.of(Keys.scaffoldKey.currentContext).trans("description"),
        ),
        Positioned(
          top: -40.0,
          left: -40.0,
          child: CircleIcon(
            iconPath: "assets/fitness_app/breakfast.png"
          ),
        ),
        Positioned(
          bottom: -20.0,
          right: -20.0,
          child: CircleButton(callback: _callGetRandomUser),
        )
      ],
    );
  }
}
