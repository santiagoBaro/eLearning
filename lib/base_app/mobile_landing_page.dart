import 'package:elearning/base_app/important_information.dart';
import 'package:elearning/base_app/master_drawer.dart';
import 'package:elearning/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      endDrawer: Drawer(
        child: ImportantInformationSlide(),
      ),
      body: LandingPage(),
    );
  }
}
