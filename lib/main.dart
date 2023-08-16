
import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/Splash.dart';
import 'package:flutter_demo/screens/cart.dart';
import 'package:flutter_demo/screens/detail.dart';

import 'package:flutter_demo/screens/home.dart';
import 'package:flutter_demo/screens/login.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widgets/MyTheme.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // late final FirebaseMessaging _messaging;

  /*void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // TODO: handle the received notifications
    } else {
      print('User declined or has not accepted permission');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Splash(),
      themeMode: ThemeMode.light,
      theme: MyTheme.themedata(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        // "/": (context) => Login(),
        // MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.detailRoute: (context) => Detail(),
        MyRoutes.cartRoute: (context) => Cart(),
      },
    );
  }
}
