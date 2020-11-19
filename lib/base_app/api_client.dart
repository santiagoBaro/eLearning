import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/data_types/content_dataType.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/book_element_dataType.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:elearning/data_types/task_datatype.dart';
import 'package:elearning/data_types/user_dataType.dart';
import 'package:elearning/pages/book_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://burgerts.noip.me/SAPPIO-API-0.1";
var authHeader = {
  HttpHeaders.authorizationHeader: "Bearer ${storedUserCredentials.getToken()}",
  "Content-Type": "application/json"
};

// Future httpsClient() async {
//   var serverContext = SecurityContext(); /*1*/
//   serverContext.useCertificateChain(certificateChain); /*2*/
//   serverContext.usePrivateKey(serverKey, password: 'dartdart'); /*3*/

//   var server = await HttpServer.bindSecure(
//     'localhost',
//     4047,
//     serverContext,
//   );
//   print('Listening on localhost:${server.port}');
//   await for (HttpRequest request in server) {
//     request.response.write('Hello, world!');
//     await request.response.close();
//   }
// }
class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal();

  //* AUTHENTICATION
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
      storedUserCredentials.userData =
          User.fromJson(jsonDecode(response.body)["usuario"]);
      saveUserCredentials();
      print(storedUserCredentials.userData.toCompleteJson());
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

  //* COURSES
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

  Future<bool> updCourse({Course course}) async {
    print(course.id);
    var response = await http.put(
      '$baseUrl/cursos/editarCurso/${course.id}',
      body: jsonEncode(course.toNestedJson()),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //* CONTENT
  Future<List<Content>> getContentByCourse({Course curso}) async {
    var response = await http.get(
      '$baseUrl/libros/curso/${curso.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<Content> contentList = List<Content>();
      for (var i = 0; i < jsonResponse.length; i++) {
        contentList.add(Content.fromJson(jsonResponse[i]));
      }
      return contentList;
    }
    return List<Content>();
  }

  Future<bool> addContent({Content content, Course curso}) async {
    var response = await http.post(
      '$baseUrl/libros/altaLibro/${curso.id}',
      body: jsonEncode(content.toNestedJson()),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updContent({Content content, Course curso}) async {
    var response = await http.post(
      '$baseUrl/libros/editarLibro/${curso.id}',
      body: jsonEncode(content.toNestedJson()),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> delContent({Content content, Course curso}) async {
    var response = await http.post(
      '$baseUrl/libros/editarLibro/${content.id}/${curso.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //* BOOK
  Future<List<BookElement>> getBook({Content content}) async {}

  //* TASKS
  Future<List<Task>> getTasksByUser() async {
    var response = await http.get(
      '$baseUrl/tareas/byUsuario/${storedUserCredentials.userData.mail}',
      headers: authHeader,
    );
    print('getTasksByUser.statusCode : ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<Task> contentList = List<Task>();
      for (var i = 0; i < jsonResponse.length; i++) {
        contentList.add(Task.fromJson(jsonResponse[i]));
      }
      print(contentList.length);
      return contentList;
    }
    return List<Task>();
  }

  Future<List<Task>> getTasksByCourse({Course curso}) async {
    var response = await http.get(
      '$baseUrl/tareas/byCurso/${curso.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<Task> contentList = List<Task>();
      for (var i = 0; i < jsonResponse.length; i++) {
        contentList.add(Task.fromJson(jsonResponse[i]));
      }
      return contentList;
    }
    return List<Task>();
  }

  Future<bool> addTask({Task task}) async {
    var response = await http.post(
      '$baseUrl/login',
      body: jsonEncode(task.toJson()),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updTask({Task task}) async {
    var response = await http.post(
      '$baseUrl/login',
      body: jsonEncode(task.toJson()),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> delTask({Task task}) async {
    var response = await http.delete(
      '$baseUrl/usuarios/${task.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //* FORO
  Future<List<Forum>> getForumByCourse({Course curso}) async {
    var response = await http.get(
      '$baseUrl/foros/byCurso/${curso.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<Forum> contentList = List<Forum>();
      for (var i = 0; i < jsonResponse.length; i++) {
        Forum instance = Forum.fromJson(jsonResponse[i]);
        contentList.add(instance);
        print(instance.toJson());
        print("message list lenght: ${instance.messages.length}");
      }
      print(contentList.length);
      return contentList;
    }
    return List<Forum>();
  }

  Future<List<Forum>> getForumByUser() async {
    var response = await http.get(
      // TODO cambiar endpoint
      '$baseUrl/foros/byUser/${storedUserCredentials.userData.id}',
      headers: authHeader,
    );
    print('getforumByUser.statusCode : ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<Forum> contentList = List<Forum>();
      for (var i = 0; i < jsonResponse.length; i++) {
        contentList.add(Forum.fromJson(jsonResponse[i]));
      }
      print(contentList.length);
      return contentList;
    }
    return List<Forum>();
  }

  Future<bool> addForum({Forum foro, Course curso}) async {
    var response = await http.post(
      '$baseUrl/foros/altaForo/${curso.id}',
      body: jsonEncode(foro.toJson()),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updForum({Forum foro}) async {
    var response = await http.post(
      '$baseUrl/foros/editarForo/${foro.id}',
      body: jsonEncode(foro.toJson()),
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> delForum({Forum foro, Course curso}) async {
    var response = await http.delete(
      '$baseUrl/foros/bajaForo/${foro.id}/${curso.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  comForum(String forumId, String message) {}
}
