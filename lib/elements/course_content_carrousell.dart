import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/content_dataType.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/pages/book_page.dart';
import 'package:flutter/material.dart';

import 'course_content_card.dart';

class ContentCarrousell extends StatelessWidget {
  final Function(Widget) onElementSelected;
  final Course curso;
  const ContentCarrousell({
    Key key,
    @required this.curso,
    this.onElementSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = ApiClient();
    return FutureBuilder<List<Content>>(
      future: client.getContentByCourse(curso: curso),
      builder: (BuildContext context, AsyncSnapshot<List<Content>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Container(
              height: 150,
              child: Center(
                  child: Text('Todavia no tienes ningur curso disponible')),
            );
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: () => onElementSelected(BookPage()),
                      child: CourseContentCard(
                        icon: Icons.cancel_outlined,
                        name: snapshot.data[index].titulo,
                        bkgColor: Colors.green[300],
                      ),
                    ),
                    //snapshot.data[index].nombre
                  );
                });
          }
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}