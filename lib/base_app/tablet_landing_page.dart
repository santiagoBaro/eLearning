import 'package:elearning/pages/course_page.dart';
import 'package:flutter/material.dart';

import 'important_information.dart';
import 'master_drawer.dart';

class TabletLandingPage extends StatelessWidget {
  const TabletLandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Image.asset(
                'assets/images/LogoSappio.png',
                height: 40,
              ),
            ),
            Text('Sappio'),
          ],
        ),
      ),
      drawer: Drawer(
        child: Master(),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CoursePage(), //LandingPage(),
          ),
          Container(
            width: 300,
            color: Colors.grey[200],
            child: ImportantInformationSlide(),
          ),
        ],
      ), //LandingPage(),
    );
  }
}
