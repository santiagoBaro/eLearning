// import 'package:elearning/firebase/upload_files.dart';

// import 'dart:io';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:path/path.dart' as path;
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';
import 'dart:html';

class FireStorageService extends ChangeNotifier {
  FireStorageService() {
    initializeApp(
        apiKey: "AIzaSyDEktNdn4CsMUxeOyVkPFBnaoAdNhcpEPc",
        authDomain: "fir-recipes-b5611.firebaseapp.com",
        databaseURL: "https://fir-recipes-b5611.firebaseio.com",
        projectId: "fir-recipes-b5611",
        storageBucket: "fir-recipes-b5611.appspot.com",
        messagingSenderId: "728428768644");
  }

  static Future<dynamic> loadFromStorage(
      BuildContext context, String image) async {
    // fb.StorageReference _ref = fb.storage().ref('images');
    var url = await storage().ref(image).getDownloadURL();
    return url;
  }

  static _onSelected(File imageFile) async {
    final filePath = 'images/${DateTime.now()}.png';
    fb
        .storage()
        .refFromURL('gs://push-notifications-ee58a.appspot.com')
        .child(filePath)
        .put(imageFile);
  }

  static uploadImage() async {
    InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        _onSelected(file);
      });
    });
  }
}

// onSelected(File imageFile) async {
//   final filePath = 'images/${DateTime.now()}.png';
//   setState(() {
//     fb
//         .storage()
//         .refFromURL('gs://push-notifications-ee58a.appspot.com')
//         .child(filePath)
//         .put(imageFile);
//   });
// }

// void uploadImage() async {
//   InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
//   uploadInput.click();

//   uploadInput.onChange.listen((event) {
//     final file = uploadInput.files.first;
//     final reader = FileReader();
//     reader.readAsDataUrl(file);
//     reader.onLoadEnd.listen((event) {
//       onSelected(file);
//     });
//   });
// }

// void uploadToStorage() {
//   final dateTime = DateTime.now();
//   final path = 'images/$dateTime';
//   uploadImage(
//     onSelected: (file) {
//       fb
//           .storage()
//           .refFromURL('gs://push-notifications-ee58a.appspot.com')
//           .child(path)
//           .put(file)
//           .future
//           .then((_) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc('user.id')
//             .update({'photo_url': path});
//       });
//     },
//   );
// }
