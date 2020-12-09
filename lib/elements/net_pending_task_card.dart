import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/base_app/firestore_connection.dart';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/data_types/task_datatype.dart';
import 'package:elearning/elements/score_task.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:elearning/data_types/net_section.dart';

class PendingTaskCard extends StatelessWidget {
  final urlController = TextEditingController();
  final NetActividad task;
  PendingTaskCard({
    Key key,
    @required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      constraints: BoxConstraints(maxWidth: 600),
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          //* LOG-OUT  BUTTON PRESSED POP-UP
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFB6107),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Alta entrega - ${task.nombre}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(task.descripcion),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(task.fechaFinalizada.split("T")[0]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text('Cancelar'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: urlController,
                          decoration: InputDecoration(labelText: 'url'),
                        ),
                      ),
                      ElevatedButton(
                        child: Text("Enviar"),
                        onPressed: () async {
                          if (urlController.text != "") {
                            var client = ApiClient();
                            bool valid = false;
                            // valid = await client.submitTask(
                            //     tarea: task, url: urlController.text);
                            if (valid) {
                              showToast('La tarea fue entregada correctamente',
                                  context: context,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
                                  reverseAnimation:
                                      StyledToastAnimation.slideToBottom,
                                  startOffset: Offset(0.0, 3.0),
                                  reverseEndOffset: Offset(0.0, 3.0),
                                  position: StyledToastPosition.bottom,
                                  duration: Duration(seconds: 4),
                                  //Animation duration   animDuration * 2 <= duration
                                  animDuration: Duration(seconds: 1),
                                  curve: Curves.elasticOut,
                                  reverseCurve: Curves.fastOutSlowIn);
                            } else {
                              showToast('Error al entregar la tarea',
                                  context: context,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
                                  reverseAnimation:
                                      StyledToastAnimation.slideToBottom,
                                  startOffset: Offset(0.0, 3.0),
                                  reverseEndOffset: Offset(0.0, 3.0),
                                  position: StyledToastPosition.bottom,
                                  duration: Duration(seconds: 4),
                                  //Animation duration   animDuration * 2 <= duration
                                  animDuration: Duration(seconds: 1),
                                  curve: Curves.elasticOut,
                                  reverseCurve: Curves.fastOutSlowIn);
                            }
                          }
                        },
                      )
                    ],
                  ),
                );
              });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //* COLOR DECORATION
            Container(
              width: 4,
              height: 70,
              color: Colors.amber,
            ),
            //* DATE
            Container(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buildDate(task.fechaFinalizada),
                    style: mainTextStyle,
                  ),
                  Text(
                    'Fri',
                    style: secondaryTextStyle,
                  ),
                ],
              ),
            ),
            //* SEPARATOR
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              width: 1,
              height: 60,
              color: Colors.grey[300],
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* TASK NAME
                    Text(
                      task.nombre,
                      style: mainTextStyle,
                      overflow: TextOverflow.fade,
                    ),
                    //* COURSE NAME
                    Container(
                      child: Text(
                        task.descripcion,
                        style: secondaryTextStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle mainTextStyle = TextStyle(
  fontSize: 18,
  color: myAppTheme['SecondaryTextColor'],
  fontWeight: FontWeight.bold,
);

TextStyle secondaryTextStyle = TextStyle(
  color: myAppTheme['PrimaryTextColor'],
);

Future<List<File>> getFile() async {
  FilePickerResult result =
      await FilePicker.platform.pickFiles(allowMultiple: true);

  if (result != null) {
    List<File> files = result.paths.map((path) => File(path)).toList();
    return files;
  } else {
    // User canceled the picker
    return List<File>();
  }
}

String _buildDate(String date) {
  String base = date.split("T")[0];
  var elem = base.split("-");
  return "${elem[1]}/${elem[2]}";
}
