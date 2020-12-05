// import 'dart:io';
// import 'package:firebase/firebase.dart' as fb;
// import 'dart:html' as html;
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/material.dart';

// class FirebaseDownloadButton extends StatefulWidget {
//   final String url;
//   FirebaseDownloadButton({Key key, @required this.url}) : super(key: key);

//   @override
//   _FirebaseDownloadButtonState createState() => _FirebaseDownloadButtonState();
// }

// class _FirebaseDownloadButtonState extends State<FirebaseDownloadButton> {
//   Future<void> downloadFileExample() async {
//     var file = fb.storage().refFromURL(widget.url);
//   }

//   void downloadFile() {
//     html.AnchorElement anchorElement = new html.AnchorElement(href: widget.url);
//     anchorElement.download = widget.url;
//     anchorElement.click();
//   }

//   openInANewTab() {
//     html.window.open(widget.url, 'PlaceholderName');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         openInANewTab();
//       },
//       child: Text("Descargar Archivo"),
//     );
//   }
// }
