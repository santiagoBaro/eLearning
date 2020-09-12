import 'package:flutter/material.dart';

class ParagraphBookElement extends StatelessWidget {
  final String text;
  const ParagraphBookElement({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: _paragraphTextStyle,
      ),
    );
  }
}

TextStyle _paragraphTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.grey[700],
);
