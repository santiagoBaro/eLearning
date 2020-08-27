import 'package:flutter/material.dart';

import 'course_content_card.dart';
import 'course_header.dart';
import 'notification_card.dart';
import 'pending_task_card.dart';

class CoursePageBody extends StatelessWidget {
  const CoursePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CourseHeader(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CourseContentCard(),
              CourseContentCard(),
            ],
          ),
          //* TASKS
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
          //* NOTIFICATIONS
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
        ],
      ),
    );
  }
}
