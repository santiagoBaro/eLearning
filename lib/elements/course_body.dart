import 'package:elearning/pages/book_page.dart';
import 'package:flutter/material.dart';

import 'course_content_card.dart';
import 'course_header.dart';
import 'notification_card.dart';
import 'pending_task_card.dart';

class CoursePageBody extends StatelessWidget {
  final Function(Widget) onElementSelected;
  const CoursePageBody({
    Key key,
    this.onElementSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CourseHeader(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => onElementSelected(BookPage()),
                  child: CourseContentCard(
                    icon: Icons.cancel_outlined,
                    name: 'Teorico',
                    bkgColor: Colors.green[300],
                  ),
                ),
                InkWell(
                  onTap: () => onElementSelected(BookPage()),
                  child: CourseContentCard(
                    name: 'Practico',
                    bkgColor: Colors.lime[400],
                    currentIndex: '20',
                    targetIndex: '25',
                  ),
                ),
              ],
            ),
          ),
          //* TASKS
          Container(
            height: 1,
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 20,
            ),
          ),
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
          PendingTaskCard(),
          //* NOTIFICATIONS
          Container(
            height: 1,
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 20,
            ),
          ),
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
        ],
      ),
    );
  }
}
