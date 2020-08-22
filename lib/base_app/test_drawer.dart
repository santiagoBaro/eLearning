import 'package:elearning/pages/landing_page.dart';
import 'package:flutter/material.dart';

import 'important_information.dart';
import 'master_drawer.dart';

class DrawerLandingPage extends StatefulWidget {
  DrawerLandingPage({Key key}) : super(key: key);

  @override
  _DrawerLandingPageState createState() => _DrawerLandingPageState();
}

class _DrawerLandingPageState extends State<DrawerLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eLearning'),
      ),
      drawer: Drawer(
        child: Master(),
      ),
      endDrawer: Drawer(
        child: ImportantInformationSlide(),
      ),
      body: LandingPage(),
    );
  }
}
