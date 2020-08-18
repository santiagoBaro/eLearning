import 'package:flutter/material.dart';

import 'master_page.dart';

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
        child: ListView(
          children: [
            Text('tille 1'),
            Text('tille 2'),
            Text('tille 3'),
            Text('tille 4'),
            Text('tille 5'),
            Text('tille 6'),
          ],
        ),
      ),
      body: Center(
        child: Text('body'),
      ),
    );
  }
}
