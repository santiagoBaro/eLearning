import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/elements/task_form.dart';
import 'package:flutter/material.dart';
import 'package:elearning/data_types/net_course.dart';
import 'package:elearning/base_app/api_client.dart';

import 'content_form.dart';
import 'course_content_carrousell.dart';
import 'course_content_form_listing.dart';
import 'course_form.dart';
import 'course_forum_form_listing.dart';
import 'course_forum_list.dart';
import 'course_header.dart';
import 'course_section.dart';
import 'course_section_listing.dart';
import 'course_task_form_listing.dart';
import 'course_task_listing.dart';
import 'foro_form.dart';

class CoursePageBody extends StatelessWidget {
  final Function(Widget) onElementSelected;
  final String cursoId;
  const CoursePageBody({
    Key key,
    this.onElementSelected,
    @required this.cursoId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = ApiClient();
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 700,
        ),
        child: FutureBuilder<NetCourse>(
          future: client.getCousreDetail(id: cursoId),
          builder: (BuildContext context, AsyncSnapshot<NetCourse> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  CourseHeader(
                    nombre: snapshot.data.nombre,
                    grupo: snapshot.data.descripcion,
                  ),
                  CourseSectionListing(curso: snapshot.data),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Widget _buildPopUp(Course curso, BuildContext context) {
  return AlertDialog(
    content: Container(
      constraints: BoxConstraints(
        maxHeight: 700,
        maxWidth: 500,
        minHeight: 200,
        minWidth: 200,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CursoForm(curso: curso),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFB6107),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'contenidos del curso',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: ContentForm(curso: curso));
                            });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orangeAccent)),
                      child: Text("agregar"),
                    ),
                  ],
                ),
              ),
            ),
            ContentFormListing(curso: curso),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFB6107),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'eventos de curso',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: TaskForm(curso: curso));
                            });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orangeAccent)),
                      child: Text("agregar"),
                    ),
                  ],
                ),
              ),
            ),
            CourseTaskFormListing(curso: curso),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFB6107),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'foros del curso',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: ForoForm(curso: curso));
                            });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orangeAccent)),
                      child: Text("agregar"),
                    ),
                  ],
                ),
              ),
            ),
            CourseForumFormListing(curso: curso),
          ],
        ),
      ),
    ),
  );
}

String _abMessage(BuildContext context) {
  if (MediaQuery.of(context).size.width > 800) {
    return "Modificar Curso";
  } else {
    return "";
  }
}
