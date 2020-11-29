import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/book_element_dataType.dart';
import 'package:elearning/data_types/content_dataType.dart';
import 'package:elearning/elements/book_element_form.dart';
import 'package:elearning/elements/bool_elements/image_book_element.dart';
import 'package:elearning/elements/bool_elements/list_book_element.dart';
import 'package:elearning/elements/bool_elements/multiple_choice_book_element.dart';
import 'package:elearning/elements/bool_elements/paragraph_book_element.dart';
import 'package:elearning/elements/bool_elements/question_book_element.dart';
import 'package:elearning/elements/bool_elements/subtitle_book_element.dart';
import 'package:elearning/elements/bool_elements/title_book_element.dart';
import 'package:elearning/elements/bool_elements/video_book_element.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  final Content content;
  BookPage({Key key, @required this.content}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  // static IndexedScrollController controller =
  //     IndexedScrollController(initialIndex: 0);
  ScrollController primary_controller = ScrollController();
  var client = ApiClient();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //* BODY
          Container(
            constraints: BoxConstraints(maxWidth: 800),
            height: (MediaQuery.of(context).size.height - 100),
            child: FutureBuilder<List<BookElement>>(
              future: client.getBookContent(content: widget.content),
              builder: (BuildContext context,
                  AsyncSnapshot<List<BookElement>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Center(child: Text("no hay contenido disponibles"));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: itemBuilder(snapshot.data),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),

          //* INDEX
          Container(
            color: Colors.grey[800],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Text(
                    'INDEX',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildPopUp();
                            });
                      },
                      child: Text('Add Content'),
                    ),
                    FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildPopUp(element: testBook[4]);
                            });
                      },
                      child: Text('Mod content'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FlatButton(onPressed: () {}, child: Text('Title 1')),
                    FlatButton(onPressed: () {}, child: Text('Title 2'))
                  ],
                ),
                Row(
                  children: [
                    FlatButton(onPressed: () {}, child: Text('Title 1')),
                    FlatButton(onPressed: () {}, child: Text('Title 2'))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button(String text, VoidCallback function) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: RawMaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(10.0),
          fillColor: Colors.blue,
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 30.0),
          child: Text(text, style: TextStyle(fontSize: 12)),
          onPressed: function,
        ),
      );

  Function itemBuilder(List<BookElement> book) {
    //
    return (BuildContext context, int index) {
      //
      switch (book[index].type) {
        case "image":
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: ImageBookElement(imageUrl: book[index].elements[0])),
          );
          break;
        case "list":
          var sublist = book[index].elements;
          sublist.removeAt(1);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListBookElement(
                title: book[index].elements[0], elements: sublist),
          );
          break;
        case "multiple_choice":
          var sublist = book[index].elements;
          sublist.removeAt(1);
          sublist.removeAt(1);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: MultiplechoiceBookElement(
              question: book[index].elements[1],
              answer: int.parse(book[index].elements[0]),
              options: sublist,
            ),
          );
          break;
        case "paragraph":
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ParagraphBookElement(text: book[index].elements[0]),
          );
          break;
        case "question":
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: QuestionBookElement(
              question: book[index].elements[0],
              id: book[index].id,
            ),
          );
          break;
        case "subtitle":
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SubtitleBookElement(subTitle: book[index].elements[0]),
          );
          break;
        case "title":
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: TitleBookElement(title: book[index].elements[0]),
          );
          break;
        case "video":
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: VideoBookElement(videoUrl: book[index].elements[0]),
          );
          break;
        default:
      }
    };
  }
}

Widget _buildPopUp({BookElement element}) {
  return AlertDialog(
    content: Container(
      constraints: BoxConstraints(
        maxHeight: 700,
        maxWidth: 500,
        minHeight: 200,
        minWidth: 200,
      ),
      child: BookElementForm(element: element),
    ),
  );
}
