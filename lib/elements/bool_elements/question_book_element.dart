import 'package:flutter/material.dart';

const String defaultQuestion =
    'Odit in natus eum sed vel debitis omnis dolores nam. Architecto minima eum. Vero quis atque dolor voluptatem tempora ut doloribus. Recusandae consequuntur exercitationem quia illo quia reiciendis dolores autem. Repellat qui earum est voluptate. Ex hic ut asperiores et nostrum?';

class QuestionBookElement extends StatefulWidget {
  final String question;
  final String id;
  QuestionBookElement({
    Key key,
    this.question = defaultQuestion,
    this.id = '1',
  }) : super(key: key);

  @override
  _QuestionBookElementState createState() => _QuestionBookElementState();
}

class _QuestionBookElementState extends State<QuestionBookElement> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.question,
          style: _textStyle,
        ),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Respuesta',
          ),
        ),
        Container(
          width: 75,
          child: FlatButton(
            child: Text('Enviar respuesta'),
            onPressed: () {
              //TODO enviar respuesta
            },
          ),
        ),
      ],
    );
  }
}

TextStyle _textStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey[600],
);
