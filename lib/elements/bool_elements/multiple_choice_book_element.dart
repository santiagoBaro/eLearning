import 'package:flutter/material.dart';

const List<String> defaultList = [
  'Rempel, Huels and Nitzsche',
  'Abshire - Cartwright',
  'Upton, Bruen and Kassulke'
      'Kreiger, Lind and Lind'
];

class MultiplechoiceBookElement extends StatefulWidget {
  final String question;
  final List<String> options;
  final int answer;
  MultiplechoiceBookElement({
    Key key,
    this.question = 'Molestiae omnis qui?',
    this.options = defaultList,
    this.answer = 2,
  }) : super(key: key);

  @override
  _MultiplechoiceBookElementState createState() =>
      _MultiplechoiceBookElementState();
}

class _MultiplechoiceBookElementState extends State<MultiplechoiceBookElement> {
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
        ListView.builder(
          itemCount: widget.options.length,
          itemBuilder: (context, i) {
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: FlatButton(
                    child: Text('${i.toString()}'),
                    onPressed: () {
                      //TODO enviar respuesta
                      if (i == widget.answer) {
                        // show the answer is correct
                      } else {
                        // show the answer wrong
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(widget.options[i]),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

TextStyle _textStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey[600],
);
