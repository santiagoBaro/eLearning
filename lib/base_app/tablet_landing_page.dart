import 'package:flutter/material.dart';
import 'package:pushnotifications/pages/landing_page/landing_page.dart';
import 'important_information.dart';
import 'master_drawer.dart';

class TabletLandingPage extends StatefulWidget {
  TabletLandingPage({Key key}) : super(key: key);

  @override
  _TabletLandingPageState createState() => _TabletLandingPageState();
}

class _TabletLandingPageState extends State<TabletLandingPage> {
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
      drawer: Drawer(
        child: MasterDrawer(
          onElementSelected: (Widget val) => _setBody(val),
        ),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _body,
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

  static onElementSelected(Widget val) {}
}
