import 'package:elearning/elements/calendar_element.dart';
import 'package:elearning/elements/user_task_listing.dart';
import 'package:flutter/material.dart';

class ImportantInformationSlide extends StatefulWidget {
  ImportantInformationSlide({Key key}) : super(key: key);

  @override
  _ImportantInformationSlideState createState() =>
      _ImportantInformationSlideState();
}

class _ImportantInformationSlideState extends State<ImportantInformationSlide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height - 40),
      color: Colors.white12,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Calendar(),
            UserTaskListing(),
          ],
        ),
      ),
    );
  }
}
