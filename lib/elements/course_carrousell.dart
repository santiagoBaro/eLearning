import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/pages/course_page.dart';
import 'package:flutter/material.dart';

import 'course_card.dart';

class CourseCarrousel extends StatelessWidget {
  final Function(Widget) onElementSelected;
  CourseCarrousel({
    Key key,
    this.onElementSelected,
  }) : super(key: key);
  ApiClient client = ApiClient.getInstance();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: client.getCourseList(),
      builder: (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Container(
              height: 150,
              child: Center(
                  child: Text('Todavia no tienes ningur curso disponible')),
            );
          } else {
            return Container(
              height: 140,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () => onElementSelected(
                        CoursePage(
                          curso: snapshot.data[index],
                          onElementSelected: (Widget val) =>
                              onElementSelected(val),
                        ),
                      ),
                      child: CourseCard(
                        name: snapshot.data[index].nombre,
                        color: Colors.blueGrey,
                      ),
                    );
                  }),
            );
          }
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
