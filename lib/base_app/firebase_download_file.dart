import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class FirebaseDownloadButton extends StatefulWidget {
  FirebaseDownloadButton({Key key}) : super(key: key);

  @override
  _FirebaseDownloadButtonState createState() => _FirebaseDownloadButtonState();
}

class _FirebaseDownloadButtonState extends State<FirebaseDownloadButton> {
  Future<void> downloadFileExample() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${appDocDir.path}/download-logo.png');

    // try {
    //   await firebase_storage.FirebaseStorage.instance
    //       .ref('uploads/logo.png')
    //       .writeToFile(downloadToFile);
    // } catch (e) {
    //   // e.g, e.code == 'canceled'
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        downloadFileExample();
      },
      child: Text("Descargar Archivo"),
    );
  }
}
