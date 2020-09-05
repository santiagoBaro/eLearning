import 'package:elearning/elements/calendar_element.dart';
import 'package:elearning/elements/pending_task_card.dart';
import 'package:elearning/elements/pending_tasks_element.dart';
import 'package:elearning/elements/schedule_element.dart';
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
      color: Colors.white12,
      child: ListView(
        children: [
          Schedule(),
          Calendar(),
          PendingTasks(),
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
        ],
      ),
    );
  }
}
