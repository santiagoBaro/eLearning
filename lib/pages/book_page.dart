import 'package:elearning/elements/bool_elements/image_book_element.dart';
import 'package:elearning/elements/bool_elements/list_book_element.dart';
import 'package:elearning/elements/bool_elements/multiple_choice_book_element.dart';
import 'package:elearning/elements/bool_elements/paragraph_book_element.dart';
import 'package:elearning/elements/bool_elements/question_book_element.dart';
import 'package:elearning/elements/bool_elements/subtitle_book_element.dart';
import 'package:elearning/elements/bool_elements/title_book_element.dart';
import 'package:elearning/elements/bool_elements/video_book_element.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:video_player/video_player.dart';

class BookPage extends StatefulWidget {
  BookPage({Key key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  // static IndexedScrollController controller =
  //     IndexedScrollController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height - 100),
            child: ListView.builder(
              //controller: controller,
              itemCount: testBook.length,
              itemBuilder: itemBuilder(),
            ),
          ),
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

  Function itemBuilder() {
    //

    return (BuildContext context, int index) {
      //
      switch (testBook[index].type) {
        case ElementType.image:
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ImageBookElement(),
          );
          break;
        case ElementType.list:
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListBookElement(),
          );
          break;
        case ElementType.multiple_choise:
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: MultiplechoiceBookElement(),
          );
          break;
        case ElementType.paragraph:
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ParagraphBookElement(),
          );
          break;
        case ElementType.question:
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: QuestionBookElement(),
          );
          break;
        case ElementType.subtitle:
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SubtitleBookElement(),
          );
          break;
        case ElementType.title:
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: TitleBookElement(),
          );
          break;
        case ElementType.video:
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: VideoBookElement(
              videoPlayerController: VideoPlayerController.network(
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              ),
            ),
          );
          break;
        default:
      }
    };
  }
}

class BookElement {
  final ElementType type;
  final List<String> elements;

  BookElement({
    @required this.type,
    @required this.elements,
  });
}

enum ElementType {
  image,
  audio,
  list,
  multiple_choise,
  paragraph,
  question,
  title,
  subtitle,
  table,
  video
}

List<BookElement> testBook = [
  BookElement(
    elements: ['Bienvenidos al curso de Calculo'],
    type: ElementType.title,
  ),
  BookElement(
    elements: [
      'Enim sit quia enim sed et explicabo vitae est. Cupiditate aut perferendis eius harum. Temporibus hic tenetur. Qui neque et eveniet dolorem delectus ab libero ea quasi. At et quisquam commodi dicta eius.'
    ],
    type: ElementType.paragraph,
  ),
  BookElement(
    elements: [
      'Est nihil velit ut ab et velit consectetur et. Aliquam ut dolorem veritatis repudiandae explicabo. Eos iure facilis laudantium omnis aperiam eos qui debitis et. Quia quia explicabo debitis delectus autem tempora.'
    ],
    type: ElementType.paragraph,
  ),
  BookElement(
    elements: ['Bienvenidos al curso de Calculo'],
    type: ElementType.image,
  ),
  // BookElement(
  //   elements: [
  //     'natus repellendus doloremque',
  //     'tempore quas eaque',
  //     'possimus ut reiciendis',
  //     'quos harum nobis'
  //   ],
  //   type: ElementType.list,
  // ),
  BookElement(
    elements: ['9942343825', 'Aliquid repellendus distinctio sit dolores?'],
    type: ElementType.question,
  ),
  BookElement(
    elements: ['Autem est sunt nobis cum est perferendis.'],
    type: ElementType.subtitle,
  ),
  BookElement(
    elements: ['Bienvenidos al curso de Calculo'],
    type: ElementType.video,
  ),
  BookElement(
    elements: [
      'Earum consequatur dolores possimus. Non molestiae quos. Iure quas vel reprehenderit voluptatem atque aut ex. Eos eos omnis. Sit voluptas tenetur quas ducimus mollitia alias laboriosam corrupti. Quia sint dolor omnis qui error mollitia. Consequatur maiores autem. Consequatur et voluptas quo reprehenderit non. Earum nihil quo.Sed dolores qui id reprehenderit sed dolores facere consequatur. Consequatur ut fugit possimus eos quia. Rerum provident rerum saepe repellat nesciunt dignissimos cupiditate laudantium voluptas. Consequatur omnis et necessitatibus. Necessitatibus rerum pariatur et. Asperiores quis iste eligendi qui laborum odit ab culpa at.'
    ],
    type: ElementType.paragraph,
  ),
  // BookElement(
  //   elements: [
  //     '2',
  //     'Quia quod illum voluptatem autem molestiae et ducimus',
  //     'Enim fugit nulla alias odio voluptas quam',
  //     'natus aut soluta',
  //     'Quibusdam qui nisi.',
  //     'Iusto aut quas.'
  //   ],
  //   type: ElementType.multiple_choise,
  // ),
  BookElement(
    elements: ['Bienvenidos al curso de Calculo'],
    type: ElementType.image,
  ),
  BookElement(
    elements: ['Bienvenidos al curso de Calculo'],
    type: ElementType.title,
  ),
  BookElement(
    elements: [
      'Necessitatibus cum voluptas consequatur quas. Omnis perspiciatis quo. Sint atque sint.'
    ],
    type: ElementType.paragraph,
  ),
  BookElement(
    elements: ['Voluptatem et nemo a consequatur voluptates?'],
    type: ElementType.question,
  ),
];
