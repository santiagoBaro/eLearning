import 'package:flutter/material.dart';
import 'base_app/app_builder.dart';
import 'pages/onboarding/pushNotificationProvider.dart';

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
    super.initState();

    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.messagesStream.listen((data) {});
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
