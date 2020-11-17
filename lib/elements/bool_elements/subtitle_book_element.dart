import 'package:flutter/material.dart';

class SubtitleBookElement extends StatelessWidget {
  final String subTitle;
  const SubtitleBookElement({
    Key key,
    @required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //* TITLE
        Text(
          subTitle,
          textAlign: TextAlign.left,
          style: nameTextStyle,
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
