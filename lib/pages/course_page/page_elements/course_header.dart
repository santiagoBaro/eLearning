import 'package:flutter/material.dart';

class CourseHeader extends StatelessWidget {
  final String nombre;
  final String grupo;
  const CourseHeader({Key key, this.nombre, this.grupo}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Text(
                nombre,
                style: nameTextStyle,
              ),
            ),
            Container(
              height: 1,
              constraints: BoxConstraints(
                maxWidth: 700,
              ),
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(horizontal: 40.0),
            ),
            //* COURSE GROUP
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Text(
                grupo,
                style: groupTextStyle,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle nameTextStyle = TextStyle(
  fontSize: 45,
  color: Colors.grey[700],
);

TextStyle groupTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey,
);
