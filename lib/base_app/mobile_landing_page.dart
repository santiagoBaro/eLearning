import 'package:elearning/pages/landing_page.dart';
import 'package:flutter/material.dart';

import 'important_information.dart';
import 'master_drawer.dart';

class MoblieLandingPage extends StatefulWidget {
  MoblieLandingPage({Key key}) : super(key: key);

  @override
  _MoblieLandingPageState createState() => _MoblieLandingPageState();
}

class _MoblieLandingPageState extends State<MoblieLandingPage> {
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
