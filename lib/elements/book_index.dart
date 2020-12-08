import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/book_element_dataType.dart';
import 'package:elearning/data_types/content_dataType.dart';
import 'package:flutter/material.dart';

class BookIndex extends StatelessWidget {
  final Content content;
  const BookIndex({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiClient client = ApiClient.getInstance();
    return FutureBuilder<List<BookElement>>(
      future: client.getBookContent(content: content),
      builder:
          (BuildContext context, AsyncSnapshot<List<BookElement>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Container(
              height: 75,
              child: Center(child: Text("No hay contenido disponible")),
            );
          }
          // List<BookElement> displayList = snapshot.data;
          List<BookElement> displayList =
              snapshot.data.where((f) => f.type == "title").toList();
          return Container(
            height: 75,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: displayList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 150,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 15,
                        ),
                        child: Text(
                          displayList[index].stringElements,
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
