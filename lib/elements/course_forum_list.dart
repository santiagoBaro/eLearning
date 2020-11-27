import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:flutter/material.dart';
import 'notification_card.dart';

class CourseFormListing extends StatelessWidget {
  final Course curso;
  const CourseFormListing({Key key, @required this.curso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = ApiClient();
    return FutureBuilder<List<Forum>>(
      future: client.getForumByCourse(curso: curso),
      builder: (BuildContext context, AsyncSnapshot<List<Forum>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Text("no hay foros disponibles");
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return NotificationCard(foro: snapshot.data[index]);
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
