import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:pushnotifications/data_types/task_datatype.dart';
import 'package:flutter/material.dart';
import 'package:pushnotifications/pages/shared_elements/pending_task_card.dart';

class CourseTaskListing extends StatelessWidget {
  final Course curso;
  const CourseTaskListing({Key key, @required this.curso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = ApiClient();
    return FutureBuilder<List<Task>>(
      future: client.getTasksByCourse(curso: curso),
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Container(
              child: Text("No hay tareas pendentes"),
              height: 100,
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return PendingTaskCard(task: snapshot.data[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
