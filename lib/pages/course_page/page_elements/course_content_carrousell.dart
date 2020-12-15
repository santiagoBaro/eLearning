import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/content_dataType.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:flutter/material.dart';
import 'package:pushnotifications/pages/book_page/book_page.dart';

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
              child: Center(child: Text('Todavía no hay contenido disponible')),
            );
          } else {
            return Container(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () => onElementSelected(
                        BookPage(content: snapshot.data[index]),
                      ),
                      child: CourseContentCard(
                        icon: Icons.cancel_outlined,
                        name: snapshot.data[index].titulo,
                        bkgColor: Colors.green[300],
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
