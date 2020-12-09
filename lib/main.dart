import 'package:flutter/material.dart';
import 'package:pushnotifications/src/pages/homePage.dart';
import 'package:pushnotifications/src/pages/messagePage.dart';
import 'package:pushnotifications/src/providers/pushNotificationProvider.dart';

import 'base_app/app_builder.dart';

//
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.messagesStream.listen((data) {
      // print('argument desde main: $argument');
      // Navigator.pushNamed(context,'mensaje');
      //navigatorKey.currentState.pushNamed('message', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/LogoSappio.png"), context);
    precacheImage(
        AssetImage("assets/images/background_mountains.jpg"), context);
    precacheImage(AssetImage("assets/images/huevo.png"), context);
    precacheImage(AssetImage("assets/images/mente.png"), context);
    precacheImage(AssetImage("assets/images/transporte.png"), context);
    return MaterialApp(
      title: 'Sappio',
      theme: ThemeData(
        fontFamily: 'AvenirNextLTPro',
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BaseApp(),
    );
  }
}
