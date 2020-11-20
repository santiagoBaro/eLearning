import 'package:elearning/firebase/upload_files.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/src/html_with_internals.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class FireStorageService extends ChangeNotifier {
  FireStorageService._();
  FireStorageService();

  static Future<dynamic> loadFromStorage(BuildContext context, String image) {
    throw ("Platform not found");
  }

  static Future<Uri> uploadToStorage({
    BuildContext context,
    html.File file,
    String type,
    String fileName,
  }) async {
    throw ("Platform not found");
  }

  static Future<Uri> uploadImageToFirebaseAndShareDownloadUrl(
      html.File info) async {
    throw ("Platform not found");
  }
}
