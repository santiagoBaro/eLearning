import 'package:flutter/material.dart';

class TitleBookElement extends StatelessWidget {
  final String title;

  const TitleBookElement({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* TITLE
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: nameTextStyle,
          ),
        ),
        //* SEPARATOR
        Container(
          height: 1,
          constraints: BoxConstraints(
            maxWidth: 700,
          ),
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 40.0),
        ),
      ],
    );
  }
}

TextStyle nameTextStyle = TextStyle(
  fontSize: 45,
  color: Colors.grey[700],
);
