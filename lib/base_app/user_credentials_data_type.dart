import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

final key = Key.fromUtf8('Ng#lRznZd*#Je^A#dp5c4#QrkEJbmDgF');
final iv = IV.fromLength(16);
final encrypter = Encrypter(AES(key));

UserCredentials storedUserCredentials;

Future<Null> saveUserCredentials() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("Sapio", jsonEncode(storedUserCredentials));
}

final UserCredentials emptyUser = UserCredentials(
  nickName: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: true,
);

final UserCredentials logedOffUser = UserCredentials(
  nickName: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: false,
);

class UserCredentials {
  String nickName;
  String token;
  List<String> searchedTerms;
  bool isNewUser;
  String carrera;

  UserCredentials({this.isNewUser, this.nickName, this.token, this.carrera});

  setNickname(String newNickname) {
    nickName = encrypter.encrypt(newNickname, iv: iv).base64;
    saveUserCredentials();
  }

  setCarrera(String newCarrera) {
    carrera = encrypter.encrypt(newCarrera, iv: iv).base64;
    saveUserCredentials();
  }

  setToken(String newToken) {
    token = encrypter.encrypt(newToken, iv: iv).base64;
    saveUserCredentials();
  }

  String getNickname() {
    return encrypter.decrypt64(nickName, iv: iv);
  }

  String getToken() {
    return encrypter.decrypt64(token, iv: iv);
  }

  String getCarrera() {
    return encrypter.decrypt64(carrera, iv: iv);
  }

  addSearch(String searchTearm) {
    searchedTerms.remove(searchTearm);
    searchedTerms.add(searchTearm);
  }

/*  UserCredentials.fromJson(Map<String, dynamic> json) {
    nickName = json['nickName'];
    token = json['token'];
    isNewUser = json['isNewUser'];
  }
  */
  factory UserCredentials.fromJson(Map<String, dynamic> json) {
    return UserCredentials(nickName: json['nickName'], token: json['token']
        // isNewUser = json['isNewUser'],

        );
  }

  Map<String, dynamic> toJson() => {
        'nickName': nickName,
        'token': token,
        'isNewUser': isNewUser,
      };
}
