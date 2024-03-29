import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:pushnotifications/data_types/task_datatype.dart';
import 'package:flutter/material.dart';
import 'package:pushnotifications/forms/task_form.dart';

class CourseTaskFormListing extends StatelessWidget {
  final Course curso;
  const CourseTaskFormListing({Key key, @required this.curso})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = ApiClient();
    return FutureBuilder<List<Task>>(
      future: client.getTasksByCourse(curso: curso),
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Container(
              height: 75,
              child: Center(child: Text("No hay tareas pendientes")),
            );
          }
          return Container(
            height: 75,
            width: 400,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 150,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: TaskForm(
                                task: snapshot.data[index],
                                curso: curso,
                              ));
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 15,
                        ),
                        child: Text(
                          snapshot.data[index].titulo,
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey[200]),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
