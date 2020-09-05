import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_app_values.dart';

final key = Key.fromUtf8('Ng#lRznZd*#Je^A#dp5c4#QrkEJbmDgF');
final iv = IV.fromLength(16);
final encrypter = Encrypter(AES(key));

UserCredentials storedUserCredentials;

Future<Null> saveUserCredentials() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(BaseAppValues().appName, jsonEncode(storedUserCredentials));
}

final UserCredentials emptyUser = UserCredentials(
  nickName: encrypter.encrypt("empty", iv: iv).base64,
  password: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: true,
);

final UserCredentials logedOffUser = UserCredentials(
  nickName: encrypter.encrypt("empty", iv: iv).base64,
  password: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: false,
);

class UserCredentials {
  String nickName;
  String password;
  String token;
  List<String> searchedTerms;
  bool isNewUser;

  UserCredentials({
    this.isNewUser,
    this.nickName,
    this.password,
    this.searchedTerms,
    this.token,
  });

  setNickname(String newNickname) {
    nickName = encrypter.encrypt(newNickname, iv: iv).base64;
    saveUserCredentials();
  }

  setPassword(String newPassword) {
    password = encrypter.encrypt(newPassword, iv: iv).base64;
    saveUserCredentials();
  }

  setToken(String newToken) {
    token = encrypter.encrypt(newToken, iv: iv).base64;
    saveUserCredentials();
  }

  String getNickname() {
    return encrypter.decrypt64(nickName, iv: iv);
  }

  String getPassword() {
    return encrypter.decrypt64(password, iv: iv);
  }

  String getToken() {
    return encrypter.decrypt64(token, iv: iv);
  }

  addSearch(String searchTearm) {
    searchedTerms.remove(searchTearm);
    searchedTerms.add(searchTearm);
  }

  UserCredentials.fromJson(Map<String, dynamic> json) {
    nickName = json['nickName'];
    password = json['password'];
    token = json['token'];
    isNewUser = json['isNewUser'];
  }

  Map<String, dynamic> toJson() => {
        'nickName': nickName,
        'password': password,
        'token': token,
        'isNewUser': isNewUser,
      };
}
