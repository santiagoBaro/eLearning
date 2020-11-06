import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/couse_element_dataType.dart';
import 'package:elearning/data_types/task_datatype.dart';
import 'package:http/http.dart' as http;
import 'package:elearning/base_app/user_credentials_data_type.dart';

const String baseUrl = "http://localhost:8080";
// var client = ApiClient();

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
      }),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      storedUserCredentials.setToken(jsonDecode(response.body)["token"]);
      storedUserCredentials.setNickname(username);
      saveUserCredentials();
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
