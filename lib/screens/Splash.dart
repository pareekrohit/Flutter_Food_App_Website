import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/api/api_constant.dart';
import 'package:flutter_demo/screens/home.dart';
import 'package:flutter_demo/screens/login.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/MyColors.dart';
import '../utils/routes.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  @override
  void initState() {
    checkAlreadyLogin();
  }

  void checkAlreadyLogin() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(ApiConstant.login);

    Timer(const Duration(seconds: 4),
            () {
          if (isLoggedIn != null) {
            if (isLoggedIn) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
            } else {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
            }
          } else {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Login()));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    var imageLogo = Lottie.asset('assets/images/splash_logo.zip');
    /*var textLogo = const Text("Talk Less, \n Eat More",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700));*/

    var splashText = RichText(
        text: const TextSpan(
          // set the default style for the children TextSpans
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            children: [
              TextSpan(
                  text: 'Talk Less,\n', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 'Eat ', style: TextStyle(color: MyColors.mainColor)),
              TextSpan(text: 'More', style: TextStyle(color: Colors.black)),
            ]));

    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: imageLogo),
              Expanded(flex: 1, child: splashText)
            ],
          )),
    );
  }


}
