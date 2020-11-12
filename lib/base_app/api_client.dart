import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/couse_element_dataType.dart';
import 'package:elearning/data_types/task_datatype.dart';
import 'package:elearning/data_types/user_dataType.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://burgerts.noip.me/SAPPIO-API-0.1";
var authHeader = {
  HttpHeaders.authorizationHeader: "Bearer ${storedUserCredentials.getToken()}",
  "Content-Type": "application/json"
};

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal();

  Future<bool> login({String username, String password}) async {
    var response = await http.post(
      '$baseUrl/login',
      body: jsonEncode(<String, String>{
        "username": username,
        "password": password,
        "token": "",
      }),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      storedUserCredentials.setToken(jsonDecode(response.body)["token"]);
      storedUserCredentials
          .setName(jsonDecode(response.body)["usuario"]["nombre"] ?? "");
      storedUserCredentials.image =
          jsonDecode(response.body)["usuario"]["imagen"] ?? "";
      saveUserCredentials();
      storedUserCredentials.userData =
          User.fromJson(jsonDecode(response.body)["usuario"]);
      return true; // TODO cambiar por la logica comentada
      // if (jsonDecode(response.body)["usuario"]["tipoUsu"] != "A") {
      //   return true;
      // }
      // return false;

    }
    return false;
  }

  Future<bool> recoverPassword({String email}) async {
    var response = await http.post(
      '$baseUrl/recuperarContra',
      body: jsonEncode({
        "mail": email,
      }),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<String> getUserInformation(String token) async {
    var response = await http.get(
      baseUrl + '',
      headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );
    if (response.statusCode == 200) {}
  }

  Future<List<Course>> getCourseList() async {
    var response = await http.get(
      '$baseUrl/cursos/obtenerCursosByUsuario/${storedUserCredentials.userData.mail}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<Course> courseList = List<Course>();
      for (var i = 0; i < jsonResponse.length; i++) {
        courseList.add(Course.fromJson(jsonResponse[i]));
      }
      return courseList;
    } else {
      return List<Course>();
    }
  }

  Course getCourse(String token, String courseId) {}
  List<CourseElement> getContent(String token, String contentId) {}

  addContentPage(String courseId, String title) {}
  updContentPage(String courseId, String title) {}
  delContentPage(String courseId) {}

  addContent(CourseElement element) {}
  updContent(CourseElement element) {}
  delContent(CourseElement element) {}

  addEvent(Task task) {}
  updEvent(Task task) {}
  delEvent(Task task) {}

  addForum(String forumId, String title, String description) {}
  updForum(String forumId, String title, String description) {}
  delForum(String forumId) {}
  comForum(String forumId, String message) {}
}
