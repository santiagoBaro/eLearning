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
  prefs.setString("Sapio", jsonEncode(storedUserCredentials));
}

Future<Null> loadUserCredentials() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String data = prefs.getString("Sapio");

  storedUserCredentials.name = jsonDecode(data)["nickName"];
  storedUserCredentials.token = jsonDecode(data)["token"];
  storedUserCredentials.isNewUser = jsonDecode(data)["isNewUser"];
  storedUserCredentials.userData = User.fromJson(jsonDecode(data)["user"]);
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
    return encrypter.decrypt64(name, iv: iv);
  }

  String getToken() {
    return encrypter.decrypt64(token, iv: iv);
  }

  User getUserData() {
    if (userData == null) {
      loadUserCredentials();
    }
    return userData;
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
