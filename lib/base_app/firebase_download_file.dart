import 'dart:io';
import 'package:firebase/firebase.dart' as fb;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class FirebaseDownloadButton extends StatefulWidget {
  final String url;
  FirebaseDownloadButton({Key key, @required this.url}) : super(key: key);

  @override
  _FirebaseDownloadButtonState createState() => _FirebaseDownloadButtonState();
}

class _FirebaseDownloadButtonState extends State<FirebaseDownloadButton> {
  Future<void> downloadFileExample() async {
    fb.storage().refFromURL(widget.url);
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
