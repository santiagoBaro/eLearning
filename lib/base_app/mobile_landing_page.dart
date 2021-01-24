import 'package:pushnotifications/base_app/important_information.dart';
import 'package:flutter/material.dart';
import 'package:pushnotifications/pages/landing_page/landing_page.dart';

import 'master_drawer.dart';

class MoblieLandingPage extends StatefulWidget {
  MoblieLandingPage({Key key}) : super(key: key);

  @override
  _MoblieLandingPageState createState() => _MoblieLandingPageState();
}

class _MoblieLandingPageState extends State<MoblieLandingPage> {
  Widget _body = LandingPage(
    onElementSelected: (Widget val) => onElementSelected(val),
  );
  //Widget _body = CoursePage();
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
      drawer: Drawer(
        child: MasterDrawer(
          onElementSelected: (Widget val) => _setBody(val),
        ),
      ),
      endDrawer: Drawer(
        child: ImportantInformationSlide(),
      ),
      body: SafeArea(child: _body),
    );
  }

  static onElementSelected(Widget val) {}
}
