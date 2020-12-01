import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
// import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:firebase/firebase.dart' as fb;

class FirebaseUploadFileButton extends StatefulWidget {
  FirebaseUploadFileButton({Key key}) : super(key: key);

  @override
  _FirebaseUploadFileButtonState createState() =>
      _FirebaseUploadFileButtonState();
}

class _FirebaseUploadFileButtonState extends State<FirebaseUploadFileButton> {
  Future<void> uploadFile(File file) async {
    print("entro al upload file");
    final filePath = 'images/${DateTime.now()}.png';
    fb
        .storage()
        .refFromURL('gs://push-notifications-ee58a.appspot.com')
        .child(filePath)
        .put(file);
  }

  Future<File> getFile() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        final reader = new FileReader(); // reader.result

        reader.onLoadEnd.listen((e) {
          print("selecciono archivo");
          uploadFile(file);
        });
        reader.readAsDataUrl(file);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        getFile();
      },
      child: Text("Subir Archivo"),
    );
  }
}
