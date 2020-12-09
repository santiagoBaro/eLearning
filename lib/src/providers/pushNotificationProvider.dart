import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

String firebaseToken = "";

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _messagesStreamController = StreamController<String>.broadcast();

  Stream<String> get messagesStream => _messagesStreamController.stream;

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

  initNotifications() async {
    await _firebaseMessaging.requestNotificationPermissions();
    var token = await _firebaseMessaging.getToken();
    firebaseToken = token;
    print('FMC Token:');
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) {
    // print("On message:");
    // print("message: $message");

    final argument = message['data']['nombre'];
    // print("argumento: $argument");

    _messagesStreamController.sink.add(argument);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) {
    // print("On launch:");
    // print("message: $message");

    final argument = message['data']['nombre'];
    // print("argumento: $argument");

    _messagesStreamController.sink.add(argument);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) {
    // print("On resume:");
    // print("message: $message");

    final argument = message['data']['nombre'];
    // print("argumento: $argument");

    _messagesStreamController.sink.add(argument);
  }

  dispose() {
    _messagesStreamController?.close();
  }
}
