// import 'dart:async';
// import 'package:firebase/firebase.dart' as fb;
// import 'package:universal_html/prefer_universal/html.dart' as html;

// Future<Uri> uploadFile({html.File file, String fileName, fileType type}) async {
//   fb.StorageReference storageRef = fb.storage().ref('$type/$fileName');
//   fb.UploadTaskSnapshot uploadTaskSnapshot = await storageRef.put(file).future;

//   Uri fileUri = await uploadTaskSnapshot.ref.getDownloadURL();
//   return fileUri;
// }

enum fileType {
  video,
  image,
  file,
}
