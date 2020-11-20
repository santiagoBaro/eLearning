import 'package:elearning/firebase/upload_files.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadFromStorage(
      BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  static Future<Uri> uploadToStorage({
    BuildContext context,
    html.File file,
    String type,
    String fileName,
  }) async {
    // StorageReference storageRef = storage().ref('$type/$fileName');
    // UploadTaskSnapshot uploadTaskSnapshot = await storageRef.put(file).future;

    // Uri fileUri = await uploadTaskSnapshot.ref.getDownloadURL();
    // print(fileUri);
    // return fileUri;
  }
}
