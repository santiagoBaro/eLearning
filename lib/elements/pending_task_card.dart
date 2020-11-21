import 'package:elearning/data_types/task_datatype.dart';
import 'package:elearning/firebase/upload_files.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:elearning/firebase/fire_storage_service.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class PendingTaskCard extends StatelessWidget {
  final Task task;
  const PendingTaskCard({
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
                    children: [
                      Text(task.titulo),
                      Text(task.instructions),
                      Text(task.date.split("T")[0]),
                      Row(
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text('Cancelar'),
                          ),
                          FlatButton(
                            onPressed: () async {
                              uploadToStorage();
                              // FireStorageService.uploadToStorage(
                              //   context: context,
                              //   file: file,
                              //   fileName: "pruebita",
                              //   type: fileType.image.toString(),
                              // );
                            },
                            child: Text('subir archivo'),
                          ),
                        ],
                      ),
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

Future<html.File> getFile() async {
  FilePickerResult result = await FilePicker.platform.pickFiles();
  html.File file;
  if (result != null) {
    file = html.File(result.files.single.bytes, "test");
  } else {}
  return file;
}

String _buildDate(String date) {
  String base = date.split("T")[0];
  var elem = base.split("-");
  return "${elem[1]}/${elem[2]}";
}

enum fileType {
  video,
  image,
  file,
}
