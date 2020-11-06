import 'package:elearning/elements/course_body.dart';
import 'package:elearning/elements/course_information_card.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  final Function(Widget) onElementSelected;
  const CoursePage({Key key, this.onElementSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height - 100),
            child: CoursePageBody(
              onElementSelected: (Widget val) => onElementSelected(val),
            ),
          ),
          CourseInformationCard(),
        ],
      ),
    );
  }
}
