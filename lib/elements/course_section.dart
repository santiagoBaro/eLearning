import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:elearning/data_types/net_section.dart';

import 'course_content_card.dart';
import 'net_notification_card.dart';
import 'net_pending_task_card.dart';

class CouseSection extends StatelessWidget {
  final NetSection section;
  const CouseSection({Key key, this.section}) : super(key: key);

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
                  nombre: section.nombre,
                  grupo: section.descripcion,
                ),
                //* CONTENT
                Container(
                  height: 200,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: section.materiales.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            String fileName =
                                '${section.materiales[index].fileNom}.${section.materiales[index].fileExt}';
                            var fileBase64 =
                                base64Decode(section.materiales[index].file);

                            new File(fileName)
                                .writeAsBytes(fileBase64)
                                .then((File file) {
                              // Do something with the file.
                            });
                          },
                          child: CourseContentCard(
                            fileExt: section.materiales[index].fileExt,
                            name: section.materiales[index].fileNom,
                            bkgColor: Colors.green[300],
                          ),
                        );
                      }),
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

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: section.actividades.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PendingTaskCard(task: section.actividades[index]);
                  },
                ),

                //* FORUMS
                Container(
                  height: 1,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: section.foros.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NotificationCard(foro: section.foros[index]);
                  },
                ),
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
