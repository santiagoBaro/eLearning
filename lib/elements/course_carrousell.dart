import 'package:elearning/pages/course_page.dart';
import 'package:flutter/material.dart';

import 'course_card.dart';

class CourseCarrousel extends StatelessWidget {
  final Function(Widget) onElementSelected;
  const CourseCarrousel({
    Key key,
    this.onElementSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () => onElementSelected(CoursePage(
              onElementSelected: (Widget val) => onElementSelected(val),
            )),
            child: CourseCard(
              name: 'Proyecto',
              color: Colors.blueGrey,
            ),
          ),
          InkWell(
            onTap: () => onElementSelected(CoursePage(
              onElementSelected: (Widget val) => onElementSelected(val),
            )),
            child: CourseCard(
              name: '.NET',
              color: Colors.amberAccent,
            ),
          ),
          InkWell(
            onTap: () => onElementSelected(CoursePage(
              onElementSelected: (Widget val) => onElementSelected(val),
            )),
            child: CourseCard(
              name: 'BD No-SQL',
              color: Colors.yellowAccent,
            ),
          ),
          InkWell(
            onTap: () => onElementSelected(CoursePage(
              onElementSelected: (Widget val) => onElementSelected(val),
            )),
            child: CourseCard(
              name: 'Proyecto',
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
