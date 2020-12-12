import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:flutter/material.dart';

import 'content_form.dart';
import 'course_content_form_listing.dart';
import 'course_form.dart';
import 'course_forum_form_listing.dart';
import 'course_score_element.dart';
import 'course_task_form_listing.dart';
import 'foro_form.dart';
import 'score_user.dart';
import 'task_form.dart';

class CourseInformationCard extends StatelessWidget {
  final Course curso;
  CourseInformationCard({Key key, @required this.curso}) : super(key: key);

  final client = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 900,
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5,
                ),
                child: Text(
                  'INFO',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Visibility(
                visible: storedUserCredentials.userData.tipoUsu == "D",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildCourseForm(curso, context);
                            });
                      },
                      child: Text("Modificar Curso"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[200])),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: Container(
                                constraints: BoxConstraints(
                                  maxHeight: 700,
                                  maxWidth: 500,
                                  minHeight: 200,
                                  minWidth: 200,
                                ),
                                child: ScoreUserList(curso: curso),
                              ));
                            });
                      },
                      child: Text("Calificar Estudiantes"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[200])),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: storedUserCredentials.userData.tipoUsu == "E",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<double>(
                        future: client.getCourseScore(curso: curso),
                        builder: (BuildContext context,
                            AsyncSnapshot<double> snapshot) {
                          if (snapshot.hasData) {
                            return Score(score: snapshot.data);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle informationTextStyle = TextStyle(color: Colors.white70);

Widget _buildCourseForm(Course curso, BuildContext context) {
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
                          'Contenidos del curso',
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
                        child: Text("Agregar"),
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
                          'Eventos de curso',
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
                        child: Text("Agregar"),
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
                          'Foros del curso',
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
                        child: Text("Agregar"),
                      ),
                    ],
                  ),
                ),
              ),
              CourseForumFormListing(curso: curso),
            ],
          ),
        )),
  );
}
