import 'dart:convert';
import 'dart:io';
import 'package:pushnotifications/data_types/message_dataType.dart';
import 'package:pushnotifications/data_types/user_score.dart';
import 'package:pushnotifications/src/providers/pushNotificationProvider.dart';
import 'package:pushnotifications/data_types/content_dataType.dart';
import 'package:pushnotifications/data_types/user_dataType.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:pushnotifications/data_types/book_element_dataType.dart';
import 'package:pushnotifications/data_types/foro_dataType.dart';
import 'package:pushnotifications/data_types/task_datatype.dart';
import 'package:pushnotifications/data_types/task_score_dataType.dart';
import 'package:http/http.dart' as http;
import 'package:pushnotifications/base_app/user_credentials_data_type.dart';

import 'user_credentials_data_type.dart';

const String baseUrl = "http://burgerts.noip.me/SAPPIO-API-0.1";
UserCredentials storedUserCredentials = UserCredentials();

var authHeader;

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal();

  static setAuthHeader() {
    authHeader = {
      HttpHeaders.authorizationHeader:
          "Bearer ${storedUserCredentials.getToken()}",
      "Content-Type": "application/json"
    };
  }

  //* AUTHENTICATION
  Future<bool> login({String username, String password}) async {
    var response = await http.post(
      '$baseUrl/login',
      body: jsonEncode(<String, String>{
        "username": username,
        "password": password,
        "token": firebaseToken,
      }),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["usuario"]["tipoUsu"] != "A") {
        storedUserCredentials.setToken(jsonDecode(response.body)["token"]);
        storedUserCredentials
            .setName(jsonDecode(response.body)["usuario"]["nombre"] ?? "");

        storedUserCredentials.userData = User.fromJson(
            jsonDecode(utf8.decode(response.body.codeUnits))["usuario"]);

        saveUserCredentials(storedUserCredentials);
        setAuthHeader();
        return true;
      }
      return false;
    }
    return false;
  }

  Future<bool> updUser({User user, String pass}) async {
    var response = await http.put(
      '$baseUrl/usuarios/editarPerfil/${storedUserCredentials.getUserData().mail}',
      body: jsonEncode(user.toNestedValidatedJson(pass)),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> updPass({String newPass, String oldPass}) async {
    var body = {
      "mail": storedUserCredentials.userData.mail,
      "oldpass": oldPass,
      "newpass": newPass,
    };
    var response = await http.put(
      '$baseUrl/usuarios/cambiarPass/',
      body: jsonEncode(body),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> recoverPassword({String email}) async {
    var response = await http.post(
      '$baseUrl/usuarios/recuperarContra/$email',
      headers: {"Content-Type": "application/json"},
    );
    return response.statusCode == 200;
  }

  //* COURSES
  Future<List<Course>> getCourseList() async {
    String url =
        '$baseUrl/cursos/obtenerCursosByUsuario/${storedUserCredentials.getUserData().mail}';
    var response = await http.get(
      url,
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
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
    var response = await http.put(
      '$baseUrl/cursos/editarCurso/${course.id}',
      body: jsonEncode(course.toNestedJson()),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<List<ScoreUser>> userScoresCourse({Course course}) async {
    var response = await http.get(
      '$baseUrl/inscripciones/getCalificacionesCurso/${course.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
      List<ScoreUser> contentList = List<ScoreUser>();
      for (var i = 0; i < jsonResponse.length; i++) {
        ScoreUser instance = ScoreUser.fromJson(jsonResponse[i]);
        contentList.add(instance);
      }
      return contentList;
    }
    return List<ScoreUser>();
  }

  Future<bool> scoreUserCourse(
      {Course curso, String usrMail, String score}) async {
    var response = await http.post(
      '$baseUrl/inscripciones/calificacionFinal/${curso.id}/$usrMail/${double.parse(score)}',
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  //* CONTENT
  Future<List<Content>> getContentByCourse({Course curso}) async {
    var response = await http.get(
      '$baseUrl/libros/curso/${curso.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
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
    return response.statusCode == 200;
  }

  Future<bool> updContent({Content content, Course curso}) async {
    var response = await http.put(
      '$baseUrl/libros/editarLibro/${content.id}',
      body: jsonEncode(content.toNestedJson()),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> delContent({Content content}) async {
    var response = await http.delete(
      '$baseUrl/libros/bajaLibro/${content.id}',
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  //* BOOK
  Future<List<BookElement>> getBookContent({Content content}) async {
    var response = await http.get(
      '$baseUrl/contenidos/libro/${content.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
      List<BookElement> contentList = List<BookElement>();
      for (var i = 0; i < jsonResponse.length; i++) {
        contentList.add(BookElement.fromJson(jsonResponse[i]));
      }
      return contentList;
    }
    return List<BookElement>();
  }

  Future<bool> addElement({BookElement element, Content content}) async {
    var response = await http.post(
      '$baseUrl/contenidos/altaContenido/${content.id}',
      body: jsonEncode(element.toStringJson()),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> updElement({BookElement element}) {}

  Future<bool> delElement({BookElement element, Content content}) async {
    var response = await http.delete(
      '$baseUrl/contenidos/bajaContenido/${content.id}/${element.id}',
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  //* TASKS
  Future<List<Task>> getTasksByUser() async {
    var response = await http.get(
      '$baseUrl/tareas/byUsuario/${storedUserCredentials.getUserData().mail}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
      List<Task> contentList = List<Task>();
      for (var i = 0; i < jsonResponse.length; i++) {
        contentList.add(Task.fromJson(jsonResponse[i]));
      }
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
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
      List<Task> contentList = List<Task>();
      for (var i = 0; i < jsonResponse.length; i++) {
        contentList.add(Task.fromJson(jsonResponse[i]));
      }
      return contentList;
    }
    return List<Task>();
  }

  Future<bool> addTask({Task task, Course curso}) async {
    var response = await http.post(
      '$baseUrl/tareas/altaTarea/${curso.id}',
      body: jsonEncode(task.toJson()),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> updTask({Task task}) async {
    var response = await http.put(
      '$baseUrl/tareas/editarTarea/${task.id}',
      body: jsonEncode(task.toJson()),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> delTask({Task task, Course curso}) async {
    var response = await http.delete(
      '$baseUrl/tareas/bajaTarea/${curso.id}/${task.id}',
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<List<TaskScore>> getTaskScoresByTask({Task tarea}) async {
    var response = await http.get(
      '$baseUrl/entregas/byTarea/${tarea.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
      List<TaskScore> contentList = List<TaskScore>();
      for (var i = 0; i < jsonResponse.length; i++) {
        TaskScore instance = TaskScore.fromJson(jsonResponse[i]);
        contentList.add(instance);
      }
      return contentList;
    }
    return List<TaskScore>();
  }

  Future<bool> scoreTask({int id, int nota}) async {
    var response = await http.put(
      '$baseUrl/entregas/calificarEntrega/$id/$nota',
      // $baseUrl/entregas/calificarEntrega/$id/nota
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> submitTask({String url, Task tarea}) async {
    var body = {"mailUser": storedUserCredentials.userData.mail, "link": url};
    var response = await http.post(
      '$baseUrl}/entregas/altaEntrega/${tarea.id}',
      body: jsonEncode(body),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  //* FORO
  Future<List<Forum>> getForumByCourse({Course curso}) async {
    var response = await http.get(
      '$baseUrl/foros/byCurso/${curso.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
      List<Forum> contentList = List<Forum>();
      for (var i = 0; i < jsonResponse.length; i++) {
        Forum instance = Forum.fromJson(jsonResponse[i]);
        contentList.add(instance);
      }
      return contentList;
    }
    return List<Forum>();
  }

  Future<List<Forum>> getForumByUser() async {
    var response = await http.get(
      '$baseUrl/foros/byUsuario/${storedUserCredentials.getUserData().mail}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(utf8.decode(response.body.codeUnits));
      List<Forum> contentList = List<Forum>();
      for (var i = 0; i < jsonResponse.length; i++) {
        Forum instance = Forum.fromJson(jsonResponse[i]);
        contentList.add(instance);
      }
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
    return response.statusCode == 200;
  }

  Future<bool> updForum({Forum foro}) async {
    var response = await http.put(
      '$baseUrl/foros/editarForo/${foro.id}',
      body: jsonEncode(foro.toJson()),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> delForum({Forum foro, Course curso}) async {
    var response = await http.delete(
      '$baseUrl/foros/bajaForo/${foro.id}/${curso.id}',
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> addComentFormun({Forum foro, String message}) async {
    var body = {
      "titulo": storedUserCredentials.userData.mail,
      "contenido": message,
    };
    var response = await http.post(
      '$baseUrl/mensajes/altaMensaje/${foro.id}/${storedUserCredentials.getUserData().id}',
      body: jsonEncode(body),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> updMsg({Message mesage}) async {
    var response = await http.put(
      '$baseUrl/mensajes/${mesage.id}',
      body: jsonEncode(mesage.toJson()),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> delMsg({Message mesage}) async {
    var response = await http.delete(
      '$baseUrl/mensajes/bajaMensaje/${mesage.id}/${mesage.idForo}',
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  //* SCORE
  Future<double> getCourseScore({Course curso}) async {
    var response = await http.get(
      '$baseUrl/inscripciones/getCalificacionFinal/${curso.id}/${storedUserCredentials.getUserData().mail}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      try {
        return double.parse(response.body);
      } on Exception catch (e) {
        print("getCourseScore return body error  => $e");
      }
    }
    return 0;
  }

  bool isUserDocente() {
    bool toReturn = false;

    print("Tipo Usu: '" + storedUserCredentials.getUserData().tipoUsu + "'");

    if (storedUserCredentials.getUserData().tipoUsu == "D") {
      toReturn = true;
    }

    return toReturn;
  }
}
