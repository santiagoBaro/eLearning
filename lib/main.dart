import 'package:elearning/base_app/app_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: BaseApp(),
    );
  }
}
