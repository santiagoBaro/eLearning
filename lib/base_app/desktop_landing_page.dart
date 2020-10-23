import 'package:elearning/base_app/important_information.dart';
import 'package:elearning/pages/message_page.dart';
import 'package:flutter/material.dart';

import 'new_master_drawer.dart';

class DesktopLandingPage extends StatefulWidget {
  DesktopLandingPage({Key key}) : super(key: key);

  @override
  _DesktopLandingPageState createState() => _DesktopLandingPageState();
}

class _DesktopLandingPageState extends State<DesktopLandingPage> {
  Widget _body = MessagePage(); //LandingPage();
  // CoursePage(),
  _setBody(Widget val) {
    setState(() {
      _body = val;
    });
  }

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
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            color: Colors.grey[200],
            child: MasterDrawer(),
          ),
          Expanded(
            child: _body,
          ),
          Container(
            width: 300,
            color: Colors.grey[200],
            child: ImportantInformationSlide(),
          ),
        ],
      ),
    );
  }
}
