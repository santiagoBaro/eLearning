import 'package:flutter/material.dart';

const String defaultQuestion =
    'Recusandae consequuntur exercitationem quia illo quia reiciendis dolores autem. Repellat qui earum est voluptate. Ex hic ut asperiores et nostrum?';

class QuestionBookElement extends StatefulWidget {
  final String question;
  final int id;
  QuestionBookElement({
    Key key,
    @required this.question,
    @required this.id,
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
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Respuesta',
                ),
              ),
            ),
            Container(
              width: 75,
              child: FlatButton(
                child: Text('Enviar'),
                onPressed: () {
                  //TODO enviar respuesta
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

TextStyle _textStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey[600],
);
