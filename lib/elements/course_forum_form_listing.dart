import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:flutter/material.dart';
import 'foro_form.dart';

class CourseForumFormListing extends StatelessWidget {
  final Course curso;
  const CourseForumFormListing({Key key, @required this.curso})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiClient client = ApiClient.getInstance();
    return FutureBuilder<List<Forum>>(
      future: client.getForumByCourse(curso: curso),
      builder: (BuildContext context, AsyncSnapshot<List<Forum>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Container(
              height: 75,
              child: Center(child: Text("no hay foros disponibles")),
            );
          }
          return Container(
            height: 75,
            width: 400,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                                  content: ForoForm(
                                form: snapshot.data[index],
                                curso: curso,
                              ));
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 15),
                        child: Text(snapshot.data[index].name,
                            style: TextStyle(color: Colors.black45)),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[200])),
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
