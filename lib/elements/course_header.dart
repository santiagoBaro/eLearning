import 'package:flutter/material.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 175,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //* COURSE TITLE
            Text(
              'Nombre Curso',
              style: nameTextStyle,
            ),
            //* COURSE GROUP
            Text(
              'grupo',
              style: groupTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle nameTextStyle = TextStyle(
  fontSize: 35,
  color: Colors.grey[700],
);

TextStyle groupTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.grey[700],
);
