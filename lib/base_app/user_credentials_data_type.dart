import 'dart:convert';

import 'package:elearning/data_types/user_dataType.dart';
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
  name: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: true,
);

final UserCredentials logedOffUser = UserCredentials(
  name: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: false,
);

class UserCredentials {
  String name;
  String image;
  String token;
  User userData;
  List<String> searchedTerms;
  bool isNewUser;

  UserCredentials({
    this.isNewUser,
    this.name,
    this.token,
  });

  setName(String newNickname) {
    name = encrypter.encrypt(newNickname, iv: iv).base64;
    saveUserCredentials();
  }

  setToken(String newToken) {
    token = encrypter.encrypt(newToken, iv: iv).base64;
    saveUserCredentials();
  }

  String getNickname() {
    return encrypter.decrypt64(name, iv: iv);
  }

  String getToken() {
    return encrypter.decrypt64(token, iv: iv);
  }

  addSearch(String searchTearm) {
    searchedTerms.remove(searchTearm);
    searchedTerms.add(searchTearm);
  }

  UserCredentials.fromJson(Map<String, dynamic> json) {
    name = json['nickName'];
    token = json['token'];
    isNewUser = json['isNewUser'];
  }

  Map<String, dynamic> toJson() => {
        'nickName': name,
        'token': token,
        'isNewUser': isNewUser,
        'user': userData.toJson()
      };
}
