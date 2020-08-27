import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

import 'course_contact_info_element.dart';
import 'course_score_element.dart';

class CourseInformationCard extends StatelessWidget {
  const CourseInformationCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: eLearningMainGradient,
          stops: stops2colors,
          begin: Alignment.topLeft,
          end: Alignment.center,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5,
              ),
              child: Text('INFO',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ContactInfo(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Score(),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white24,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Comentario',
                  style: informationTextStyle,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white24,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Autem dolor sint enim tempora dolorem reprehenderit reprehenderit. Et quos voluptate dignissimos. Quia beatae itaque nihil sed quis nisi rem sed eveniet. Pariatur aliquid reprehenderit. Illum molestias ut ipsum facilis aliquam consectetur aut dolorum.',
                    maxLines: 8,
                    style: informationTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle informationTextStyle = TextStyle(color: Colors.white70);
