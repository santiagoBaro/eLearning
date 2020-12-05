export 'unsopported_firestore.dart'
    if (dart.library.html) 'web_firestore.dart'
    if (dart.library.io) 'unsopported_firestore.dart';
