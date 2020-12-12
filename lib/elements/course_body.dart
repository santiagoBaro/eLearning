import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/base_app/user_credentials_data_type.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:pushnotifications/elements/task_form.dart';
import 'package:flutter/material.dart';

import 'content_form.dart';
import 'course_content_carrousell.dart';
import 'course_content_form_listing.dart';
import 'course_form.dart';
import 'course_forum_form_listing.dart';
import 'course_forum_list.dart';
import 'course_header.dart';
import 'course_task_form_listing.dart';
import 'course_task_listing.dart';
import 'foro_form.dart';

class CoursePageBody extends StatelessWidget {
  final Function(Widget) onElementSelected;
  final Course curso;
  const CoursePageBody({
    Key key,
    this.onElementSelected,
    @required this.curso,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 750,
            ),
            child: Column(
              children: [
                CourseHeader(
                  nombre: curso.nombre,
                  grupo: curso.descripcion,
                ),
                //* CONTENT
                Container(
                  height: 200,
                  child: ContentCarrousell(
                    curso: curso,
                    onElementSelected: (Widget val) => onElementSelected(val),
                  ),
                ),
                //* TASKS
                Container(
                  height: 1,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20,
                  ),
                ),

                CourseTaskListing(curso: curso),

                //* FORUMS
                Container(
                  height: 1,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20,
                  ),
                ),
                CourseFormListing(curso: curso),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
