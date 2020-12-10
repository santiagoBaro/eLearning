import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:flutter/material.dart';

import 'course_score_element.dart';

class CourseInformationCard extends StatelessWidget {
  final Course curso;
  CourseInformationCard({Key key, @required this.curso}) : super(key: key);

  final client = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 900,
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
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
                child: Text(
                  'INFO',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<double>(
                      future: client.getCourseScore(curso: curso),
                      builder: (BuildContext context,
                          AsyncSnapshot<double> snapshot) {
                        if (snapshot.hasData) {
                          return Score(score: snapshot.data);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),

                    //Score(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle informationTextStyle = TextStyle(color: Colors.white70);
