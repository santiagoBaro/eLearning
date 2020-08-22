import 'package:flutter/material.dart';

import 'course_card.dart';

class CourseCarrousel extends StatelessWidget {
  const CourseCarrousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CourseCard(
            name: 'Proyecto',
            color: Colors.blueGrey,
          ),
          CourseCard(
            name: '.NET',
            color: Colors.amberAccent,
          ),
          CourseCard(
            name: 'BD No-SQL',
            color: Colors.yellowAccent,
          ),
          CourseCard(
            name: 'Proyecto',
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
