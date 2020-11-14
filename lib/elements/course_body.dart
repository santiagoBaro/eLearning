import 'package:elearning/data_types/content_dataType.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:elearning/data_types/task_datatype.dart';
import 'package:elearning/elements/task_form.dart';
import 'package:flutter/material.dart';

import 'content_form.dart';
import 'course_content_carrousell.dart';
import 'course_form.dart';
import 'course_header.dart';
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
          Column(
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
                constraints: BoxConstraints(
                  maxWidth: 700,
                ),
                color: Colors.grey[300],
                margin: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20,
                ),
              ),
              // CourseTaskListing(curso: curso),
              //* FORUMS
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
              // CourseFormListing(curso: curso),
            ],
          ),
          Visibility(
            child: Positioned(
              right: 30,
              top: 30,
              child: FloatingActionButton.extended(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildPopUp(courseRelleno, context);
                      });
                },
                label: Text('Modificar curso'),
                icon: Icon(Icons.border_color),
                backgroundColor: Color(0xFFFB6107),
              ),
            ),
          ),
        ],
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
            children: [
              CursoForm(
                curso: curso,
              ),
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
                                return AlertDialog(content: ContentForm());
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      content: ContentForm(
                                          content: contenidoRelleno));
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 15),
                            child: Text("Practico",
                                style: TextStyle(color: Colors.black45)),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[200])),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      content: ContentForm(
                                          content: contenidoRelleno));
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 15),
                            child: Text("Teorico",
                                style: TextStyle(color: Colors.black45)),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[200])),
                        )),
                  ],
                ),
              ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    content: TaskForm(
                                        task: taskRelleno, curso: curso));
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 15),
                          child: Text("leer capitulo 3",
                              style: TextStyle(color: Colors.black45)),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[200])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    content: TaskForm(
                                        task: taskRelleno, curso: curso));
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 15),
                          child: Text("cuestionario 2",
                              style: TextStyle(color: Colors.black45)),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[200])),
                      ),
                    ),
                  ],
                ),
              ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    content: ForoForm(form: formRelleno));
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 15),
                          child: Text("leer capitulo 3",
                              style: TextStyle(color: Colors.black45)),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[200])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    content: ForoForm(form: formRelleno));
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 15),
                          child: Text("cuestionario 2",
                              style: TextStyle(color: Colors.black45)),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[200])),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
