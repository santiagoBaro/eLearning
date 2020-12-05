import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:html' as html;
import 'package:firebase/firebase.dart' as fb;

import 'user_credentials_data_type.dart';

class FirebaseUploadFileButton extends StatefulWidget {
  final String direcorty;
  final Function(String) fbUrl;
  FirebaseUploadFileButton(
      {Key key, @required this.direcorty, @required this.fbUrl})
      : super(key: key);

  @override
  _FirebaseUploadFileButtonState createState() =>
      _FirebaseUploadFileButtonState();
}

class _FirebaseUploadFileButtonState extends State<FirebaseUploadFileButton> {
  fb.UploadTask _uploadTask;

  Future<void> uploadFile(File file) async {
    String fileExt = file.type.split("/").last;
    final filePath =
        '${widget.direcorty}/${storedUserCredentials.userData.mail}${DateTime.now()}.$fileExt';
    setState(() {
      _uploadTask = fb
          .storage()
          .refFromURL('gs://push-notifications-ee58a.appspot.com')
          .child(filePath)
          .put(file);
    });
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
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            getFile();
          },
          child: Text("Subir Archivo"),
        ),
        StreamBuilder<fb.UploadTaskSnapshot>(
          stream: _uploadTask?.onStateChanged,
          builder: (context, snapshot) {
            final event = snapshot?.data;

            // Default as 0
            double progressPercent = event != null
                ? event.bytesTransferred / event.totalBytes * 100
                : 0;

            if (progressPercent == 100) {
              snapshot.data.ref.getDownloadURL().then((value) {
                var url = value.toString();
                widget.fbUrl(url);
              });

              return Text('Successfully uploaded file 🎊');
            } else if (progressPercent == 0) {
              return SizedBox();
            } else {
              return LinearProgressIndicator(
                value: progressPercent,
              );
            }
          },
        ),
      ],
    );
  }
}

class FirebaseDownloadButton extends StatefulWidget {
  final String url;
  FirebaseDownloadButton({Key key, @required this.url}) : super(key: key);

  @override
  _FirebaseDownloadButtonState createState() => _FirebaseDownloadButtonState();
}

class _FirebaseDownloadButtonState extends State<FirebaseDownloadButton> {
  Future<void> downloadFileExample() async {
    var file = fb.storage().refFromURL(widget.url);
  }

  void downloadFile() {
    html.AnchorElement anchorElement = new html.AnchorElement(href: widget.url);
    anchorElement.download = widget.url;
    anchorElement.click();
  }

  openInANewTab() {
    html.window.open(widget.url, 'PlaceholderName');
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        openInANewTab();
      },
      child: Text("Descargar Archivo"),
    );
  }
}
