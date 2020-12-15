import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/base_app/firestore_connection.dart';
import 'package:pushnotifications/data_types/task_datatype.dart';
import 'package:pushnotifications/pages/course_page/page_elements/score_task.dart';
import 'package:pushnotifications/tools/visual_assets.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class PendingTaskCard extends StatelessWidget {
  final urlController = TextEditingController();
  final Task task;
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
                            'Entregar - ${task.titulo}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(task.instructions),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(task.date.split("T")[0]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text('Cancelar'),
                          ),
                          Visibility(
                            visible: task.entregable &&
                                storedUserCredentials.userData.tipoUsu == "E",
                            child: FirebaseUploadFileButton(
                              fbUrl: (value) async {
                                if (value != null && value != "") {
                                  urlController.text = value;
                                  // valid = await client.submitTask(
                                  //     tarea: task, url: urlController.text);
                                }
                              },
                              direcorty: 'task/${task.id.toString()}/',
                            ),
                          ),
                          Visibility(
                            visible:
                                storedUserCredentials.userData.tipoUsu == "D",
                            child: ElevatedButton(
                              child: Text("Calificar"),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          content: Container(
                                        constraints: BoxConstraints(
                                          maxHeight: 700,
                                          maxWidth: 500,
                                          minHeight: 200,
                                          minWidth: 200,
                                        ),
                                        child: ScoreTasks(tarea: task),
                                      ));
                                    });
                              },
                            ),
                            // ScoreTask
                          ),
                        ],
                      ),
                      Visibility(
                        visible: task.entregable &&
                            storedUserCredentials.userData.tipoUsu == "E",
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: urlController,
                            decoration: InputDecoration(labelText: 'url'),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: task.entregable &&
                            storedUserCredentials.userData.tipoUsu == "E",
                        child: ElevatedButton(
                          child: Text("Enviar"),
                          onPressed: () async {
                            if (urlController.text != "") {
                              var client = ApiClient();
                              bool valid = false;
                              valid = await client.submitTask(
                                  tarea: task, url: urlController.text);
                              if (valid) {
                                showToast(
                                    'La tarea fue entregada correctamente',
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
                        ),
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
                    _buildDate(task.date),
                    style: mainTextStyle,
                  )
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
                      task.titulo,
                      style: mainTextStyle,
                      overflow: TextOverflow.fade,
                    ),
                    //* COURSE NAME
                    Container(
                      child: Text(
                        task.instructions,
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

String _buildDate(String date) {
  String base = date.split("T")[0];
  var elem = base.split("-");
  return "${elem[1]}/${elem[2]}";
}
