import 'package:flutter/material.dart';
import 'package:flutter_app_redux/anim/fade_anim_example.dart';
import 'package:flutter_app_redux/anim/lottie_anim_example.dart';
import 'package:flutter_app_redux/models/user.dart';
import 'package:flutter_app_redux/redux/user/user_actions.dart';
import 'package:flutter_app_redux/redux/user/user_state.dart';
import 'package:flutter_app_redux/widgets/user_card.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app_redux/config/routes.dart';
import 'package:flutter_app_redux/config/keys.dart';
import 'package:flutter_app_redux/redux/app/app_state.dart';
import 'package:flutter_app_redux/redux/error/error_actions.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{
  final store = StoreProvider.of<AppState>(scaffoldKey.currentContext);
  bool _runFadeAnimExample;
  bool _runLottieAnimExample;

  @override
  void initState() {
    super.initState();
    _runFadeAnimExample = false;
    _runLottieAnimExample = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.6),
        border: Border.all(
          color: Colors.white,
          width: 1.0
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20.0),
                createButton(_fadeAnimExampleStart),
                SizedBox(width: 50.0),
                FadeAnimExample(
                  runAnimation: _runFadeAnimExample,
                  callback: _fadeAnimExampleCompleted
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20.0),
                createButton(_lottieAnimExampleStart),
                SizedBox(width: 50.0),
                LottieAnimExample(
                  runAnimation: _runLottieAnimExample,
                  callback: _lottieAnimExampleCompleted,
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Widget createContainer() {
    return Container(
      height: 50.0,
      width: 50.0,
      color: Colors.pink,
    );
  }

  Widget createButton(Function action) {
    return Container(
        height: 50.0,
        width: 100.0,
        margin: EdgeInsets.only(top: 25.0),
        child: MaterialButton(
          height: 36.0,
          minWidth: 80.0,
          padding: const EdgeInsets.all(5.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                  color: Colors.black,
                  width: 2.0
              )
          ),
          onPressed: () => {
            action()
          },
          color: Colors.yellow,
          child: Text("Anim"),
        )
    );
  }

  _fadeAnimExampleStart() {
    setState(() {
      _runFadeAnimExample = true;
    });
  }

  _lottieAnimExampleStart() {
    setState(() {
      _runLottieAnimExample = true;
    });
  }

  _fadeAnimExampleCompleted() {
    setState(() {
      _runFadeAnimExample = false;
    });
  }

  _lottieAnimExampleCompleted() {
    setState(() {
      _runLottieAnimExample = false;
    });
  }

}