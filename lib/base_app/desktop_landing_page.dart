import 'package:elearning/pages/landing_page.dart';
import 'package:flutter/material.dart';

import 'important_information.dart';
import 'master_drawer.dart';

class DesktopLandingPage extends StatefulWidget {
  DesktopLandingPage({Key key}) : super(key: key);

  @override
  _DesktopLandingPageState createState() => _DesktopLandingPageState();
}

class _DesktopLandingPageState extends State<DesktopLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eLearning'),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            child: Master(),
          ),
          Expanded(
            child: LandingPage(),
          ),
          Container(
            width: 300,
            child: ImportantInformationSlide(),
          ),
        ],
      ),
    );
  }
}
