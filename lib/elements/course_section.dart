import 'package:elearning/data_types/course_dataType.dart';
import 'package:flutter/material.dart';

import 'course_content_carrousell.dart';
import 'course_forum_list.dart';
import 'course_task_listing.dart';

class CouseSection extends StatelessWidget {
  final Function(Widget) onElementSelected;
  final Course curso;
  const CouseSection({Key key, this.curso, this.onElementSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: Column(
              children: [
                SectionHeader(
                  nombre: curso.nombre,
                  grupo: curso.descripcion,
                ),
                //* CONTENT
                Container(
                  height: 200,
                  child: ContentCarrousell(
                    curso: curso,
                    onElementSelected: (Widget val) => onElementSelected(val),
                  ),
                ),
                //* TASKS
                Container(
                  height: 1,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20,
                  ),
                ),

                CourseTaskListing(curso: curso),

                //* FORUMS
                Container(
                  height: 1,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20,
                  ),
                ),
                CourseFormListing(curso: curso),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String nombre;
  final String grupo;

  const SectionHeader({Key key, this.nombre, this.grupo}) : super(key: key);

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
  fontSize: 30,
  color: Colors.grey[700],
);

TextStyle groupTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey,
);
