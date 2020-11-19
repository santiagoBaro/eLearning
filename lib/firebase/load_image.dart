import 'package:elearning/firebase/fire_storage_service.dart';
import 'package:flutter/material.dart';

Future<Widget> getFireImage(BuildContext context, String image) async {
  Image m;
  await FireStorageService.loadFromStorage(context, image).then((downloadUrl) {
    m = Image.network(
      downloadUrl.toString(),
      fit: BoxFit.scaleDown,
    );
  });

  return m;
}
