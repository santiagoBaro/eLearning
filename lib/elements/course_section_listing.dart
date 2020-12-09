import 'package:flutter/material.dart';
import 'package:elearning/data_types/net_course.dart';
import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/net_section.dart';

import 'course_section.dart';

class CourseSectionListing extends StatelessWidget {
  final NetCourse curso;
  const CourseSectionListing({Key key, this.curso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: curso.secciones.length,
          itemBuilder: (BuildContext context, int index) {
            return CouseSection(section: curso.secciones[index]);
          },
        ),
      ],
    );
  }
}
