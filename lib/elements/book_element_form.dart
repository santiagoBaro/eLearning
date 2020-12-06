import 'package:elearning/data_types/book_element_dataType.dart';
import 'package:elearning/data_types/content_dataType.dart';
import 'package:elearning/elements/element_forms.dart/image_element_form.dart';
import 'package:elearning/elements/element_forms.dart/list_element_form.dart';
import 'package:elearning/elements/element_forms.dart/multiple_choice_element_form.dart';
import 'package:elearning/elements/element_forms.dart/question_element_form.dart';
import 'package:elearning/elements/element_forms.dart/subtitle_element_form.dart';
import 'package:elearning/elements/element_forms.dart/title_element_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'element_forms.dart/paragraph_element_form.dart';
import 'element_forms.dart/video_element_form.dart';

class BookElementForm extends StatefulWidget {
  final BookElement element;
  final Content content;
  BookElementForm({Key key, this.element, @required this.content})
      : super(key: key);

  @override
  _BookElementFormState createState() => _BookElementFormState();
}

class _BookElementFormState extends State<BookElementForm> {
  final _formKey = GlobalKey<FormState>();
  final contentContrller = TextEditingController();
  String dropdownValue = "title";
  bool isSubmitEnabled = true;
  bool isDeleteEnabled = true;

  @override
  void initState() {
    super.initState();
    if (widget.element != null) {
      dropdownValue = widget.element.type;
    }
  }

  Widget _buildForm({String type, BookElement element}) {
    switch (type.toLowerCase()) {
      case "image":
        return ImageElementForm(element: element, content: widget.content);
        break;
      case "list":
        return ListElementForm(element: element, content: widget.content);
        break;
      case "multiple_choice":
        return MultipleChoiceElementForm(
            element: element, content: widget.content);
        break;
      case "paragraph":
        return ParagraphElementForm(element: element, content: widget.content);
        break;
      case "question":
        return QuestionElementForm(element: element, content: widget.content);
        break;
      case "subtitle":
        return SubtitleElementForm(element: element, content: widget.content);
        break;
      case "title":
        return TitleElementForm(element: element, content: widget.content);
        break;
      case "video":
        return VideoElementForm(element: element, content: widget.content);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 700,
        maxWidth: 500,
        minHeight: 200,
        minWidth: 200,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFB6107),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Contenido',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'image',
                'list',
                'multiple_choice',
                'paragraph',
                'question',
                'title',
                'subtitle',
                'video'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Container(
              child: _buildForm(
                type: dropdownValue,
                element: widget.element,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
