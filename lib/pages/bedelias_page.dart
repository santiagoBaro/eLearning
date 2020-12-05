import 'package:elearning/elements/enrollment_grid_element.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

class BedeliasPage extends StatefulWidget {
  final int initialIndex;
  BedeliasPage({Key key, this.initialIndex = 0}) : super(key: key);

  @override
  _BedeliasPageState createState() => _BedeliasPageState();
}

class _BedeliasPageState extends State<BedeliasPage>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 3, vsync: this);
    _nestedTabController.index = widget.initialIndex;
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Scaffold(
        body: Container(
          //* BACKGROUND
          decoration: tabbedLoginHeaderBoxDecoration,
          child: Center(
            child: Column(
              children: <Widget>[
                //* TAB BAR
                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  width: screenWidth,
                  color: myAppTheme['PrimaryBackgroundColor'],
                  child: TabBar(
                    controller: _nestedTabController,
                    indicatorColor: myAppTheme['AccentColor'],
                    labelColor: myAppTheme['AccentTextColor'],
                    unselectedLabelColor: myAppTheme['SecondaryTextColor'],
                    isScrollable: true,
                    tabs: <Widget>[
                      Tab(
                        text: "Cursos",
                      ),
                      Tab(
                        text: "Exámenes",
                      ),
                      Tab(
                        text: "Eventos",
                      ),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  //* TAB VIEW
                  // THIS CONTAINER IS WHERE THE TAB DISPLAYS ITS PAGES
                  color: myAppTheme['PrimaryBackgroundColor'],
                  height: screenHeight * 0.5,
                  child: TabBarView(
                    controller: _nestedTabController,
                    children: <Widget>[
                      Container(
                        //* FIRST TAB PAGE
                        // CURSO
                        child: EnrollmentGridElement(
                          title: 'Cursos',
                        ),
                      ),
                      Container(
                        //* SECOND TAB PAGE
                        // EXAMEN
                        child: EnrollmentGridElement(
                          title: 'Exámenes',
                        ),
                      ),
                      Container(
                        //* THIRD TAB PAGE
                        // EVENTO
                        child: EnrollmentGridElement(
                          title: 'Eventos',
                        ),
                      ),
                    ],
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ),
      ),
    );
  }
}
