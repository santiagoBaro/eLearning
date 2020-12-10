import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/elements/course_body.dart';
import 'package:elearning/elements/course_information_card.dart';
import 'package:flutter/material.dart';
import 'package:elearning/data_types/net_course.dart';

class CoursePage extends StatelessWidget {
  final NetCourse curso;
  final Function(Widget) onElementSelected;
  const CoursePage({
    Key key,
    this.onElementSelected,
    @required this.curso,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CoursePageBody(
        onElementSelected: (Widget val) => onElementSelected(val),
        cursoId: curso.id,
      ),
    );
  }
}
