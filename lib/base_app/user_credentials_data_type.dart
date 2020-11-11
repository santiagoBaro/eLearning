import 'dart:convert';

import 'package:elearning/base_app/Inscripcion.dart';
import 'package:elearning/data_types/Curso.dart';
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
  int id;
  List<Inscripcion> inscripciones;
  String mail;
  List<Curso> cursos;

  UserCredentials(
      {this.isNewUser,
      this.nickName,
      this.token,
      this.carrera,
      this.id,
      this.inscripciones,
      this.mail});

  setCursos(List<Curso> cursos) {
    this.cursos = cursos;
  }

  setNickname(String newNickname) {
    nickName = encrypter.encrypt(newNickname, iv: iv).base64;
    saveUserCredentials();
  }

  setMail(String newMail) {
    mail = encrypter.encrypt(newMail, iv: iv).base64;
    saveUserCredentials();
  }

  setId(int newId) {
    id = newId;
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

  List<Curso> getCursos() {
    return this.cursos;
  }

  String getNickname() {
    return encrypter.decrypt64(nickName, iv: iv);
  }

  String getMail() {
    return encrypter.decrypt64(mail, iv: iv);
  }

  String getToken() {
    return encrypter.decrypt64(token, iv: iv);
  }

  String getCarrera() {
    return encrypter.decrypt64(carrera, iv: iv);
  }

  int getId() {
    return this.id;
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
