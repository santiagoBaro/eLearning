import 'dart:async';
import 'dart:convert';

import 'package:pushnotifications/data_types/user_dataType.dart';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_client.dart';

final key = Key.fromUtf8('Ng#lRznZd*#Je^A#dp5c4#QrkEJbmDgF');
final iv = IV.fromLength(16);
final encrypter = Encrypter(AES(key));

Future<Null> saveUserCredentials(UserCredentials storedUserCredentials) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  prefs.setString("Sappio", jsonEncode(storedUserCredentials));
}

UserCredentials emptyUser = UserCredentials(
  userData: User(),
  name: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: true,
);

UserCredentials logedOffUser = UserCredentials(
  userData: User(),
  name: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: false,
);

class UserCredentials {
  String name;
  String token;
  User userData;
  bool isNewUser;

  UserCredentials({
    this.userData,
    this.isNewUser,
    this.name,
    this.token,
  });

  setName(String newNickname) {
    name = encrypter.encrypt(newNickname, iv: iv).base64;
    saveUserCredentials(this);
  }

  setToken(String newToken) {
    token = encrypter.encrypt(newToken, iv: iv).base64;
    saveUserCredentials(this);
  }

  setUser(User u) {
    userData = u;
    saveUserCredentials(this);
  }

  String getNickname() {
    try {
      return encrypter.decrypt64(name, iv: iv);
    } catch (e) {
      return "";
    }
  }

  String getToken() {
    return encrypter.decrypt64(token, iv: iv);
  }

  User getUserData() {
    return userData;
  }

  UserCredentials.fromJson(Map<String, dynamic> json) {
    name = json['nickName'];
    token = json['token'];
    isNewUser = json['isNewUser'];

    Map<String, dynamic> jsonUserData = json['userData'];

    userData = User();

    userData.id = jsonUserData['_id'];
    userData.nombre = jsonUserData['nombre'];
    userData.mail = jsonUserData['mail'];
    userData.direccion = jsonUserData['direccion'];
    userData.imagen = jsonUserData['imagen'];
    userData.descripcion = jsonUserData['descripcion'];
    userData.carrera = jsonUserData['carrera'];
    userData.tipoDocumento = jsonUserData['tipoDocumento'];
    userData.documento = jsonUserData['documento'];
    userData.tipoUsu = jsonUserData['tipoUsu'];
  }

  Map<String, dynamic> toJson() => {
        'nickName': name,
        'token': token,
        'isNewUser': isNewUser,
        'userData': userData.toJson()
      };

  void clean() {
    name = "";
    token = "";
    userData.clean();
    saveUserCredentials(this);
  }

  void newUserData(Map<String, dynamic> json) {
    userData.id = json['_id'];
    userData.nombre = json['nombre'];
    userData.mail = json['mail'];
    userData.direccion = json['direccion'];
    userData.imagen = json['imagen'];
    userData.descripcion = json['descripcion'];
    userData.carrera = json['carrera'] ?? "";
    userData.tipoDocumento = json['tipoDocumento'];
    userData.documento = json['documento'];
    userData.tipoUsu = json['tipoUsu'];
  }
}
