import 'package:flutter/material.dart';

class SubtitleBookElement extends StatelessWidget {
  final String subTitle;
  const SubtitleBookElement({Key key, this.subTitle = 'empty subtitle'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* TITLE
        Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(
            subTitle,
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
  fontSize: 30,
  color: Colors.grey,
);
