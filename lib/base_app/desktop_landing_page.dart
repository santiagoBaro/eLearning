import 'package:pushnotifications/base_app/important_information.dart';
import 'package:pushnotifications/pages/landing_page.dart';
import 'package:flutter/material.dart';

import 'new_master_drawer.dart';

class DesktopLandingPage extends StatefulWidget {
  DesktopLandingPage({Key key}) : super(key: key);

  @override
  _DesktopLandingPageState createState() => _DesktopLandingPageState();
}

class _DesktopLandingPageState extends State<DesktopLandingPage> {
  Widget _body = LandingPage(
    onElementSelected: (Widget val) => onElementSelected(val),
  );
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
            child: MasterDrawer(
              onElementSelected: (Widget val) => _setBody(val),
            ),
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

  static onElementSelected(Widget val) {}
}
