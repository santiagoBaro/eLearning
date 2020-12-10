import 'dart:convert';
import 'dart:io';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/data_types/content_dataType.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/book_element_dataType.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:elearning/data_types/net_user.dart';
import 'package:elearning/data_types/task_datatype.dart';
import 'package:elearning/data_types/task_score_dataType.dart';
import 'package:http/http.dart' as http;
import 'package:elearning/data_types/net_course.dart';

const String baseUrl =
    "http://www.node789-api-udelaronline.web.elasticloud.uy:11015/api";
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

  //* AUTHENTICATION
  Future<bool> login({String username, String password}) async {
    var response = await http.post(
      '$baseUrl/auth/login',
      body: jsonEncode(<String, String>{
        "email": username,
        "password": password,
      }),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["tipo"] == "Alumno") {
        storedUserCredentials.setToken(jsonDecode(response.body)["token"]);
        storedUserCredentials
            .setName(jsonDecode(response.body)["nombres"] ?? "");
        storedUserCredentials.userData =
            NetUser.fromJson(jsonDecode(response.body));
        saveUserCredentials();
        return true;
      }
      return false;
    }
    return false;
  }

  Future<List<Course>> getCourseList() async {
    var response = await http.get(
      '$baseUrl/curso/usuario/${storedUserCredentials.userData.id}',
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
      print("getCourseList == ${response.statusCode}");
      return List<Course>();
    }
  }

  Future<List<NetCourse>> getnetCourseList() async {
    var response = await http.get(
      '$baseUrl/curso/usuario/${storedUserCredentials.userData.id}',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      // print(response.body);
      var jsonResponse = json.decode(response.body);
      print("LENGTH == ${jsonResponse.length}");
      List<NetCourse> courseList = List<NetCourse>();
      for (var i = 0; i < jsonResponse.length; i++) {
        courseList.add(NetCourse.fromJson(jsonResponse[i]));
      }
      return courseList;
    } else {
      print("getNetCourseList == ${response.statusCode}");
      return List<NetCourse>();
    }
  }

  Future<NetCourse> getCousreDetail({String id}) async {
    print("getCousreDetail");
    var response = await http.get(
      '$baseUrl/curso/$id',
      headers: authHeader,
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return NetCourse.fromJson(jsonResponse);
    } else {
      print("getCourseDetail == ${response.statusCode}");
      return NetCourse();
    }
  }

  Future<bool> updUser({NetUser user}) async {
    var response = await http.put(
      '$baseUrl/usuarios/editarPerfil/${storedUserCredentials.userData.email}',
      body: jsonEncode(user.toJson()),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  Future<bool> updPass({String newPass, String oldPass}) async {
    var body = {
      "mail": storedUserCredentials.userData.email,
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

  Future<bool> updCourse({Course course}) async {
    print(course.id);
    var response = await http.put(
      '$baseUrl/cursos/editarCurso/${course.id}',
      body: jsonEncode(course.toNestedJson()),
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
      var jsonResponse = json.decode(response.body);
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
      '$baseUrl/tareas/byUsuario/${storedUserCredentials.userData.email}',
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
      var jsonResponse = json.decode(response.body);
      List<TaskScore> contentList = List<TaskScore>();
      for (var i = 0; i < jsonResponse.length; i++) {
        TaskScore instance = TaskScore.fromJson(jsonResponse[i]);
        contentList.add(instance);
      }
      print(contentList.length);
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
    var body = {"mailUser": storedUserCredentials.userData.email, "link": url};
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
      var jsonResponse = json.decode(response.body);
      List<Forum> contentList = List<Forum>();
      for (var i = 0; i < jsonResponse.length; i++) {
        Forum instance = Forum.fromJson(jsonResponse[i]);
        contentList.add(instance);
      }
      print(contentList.length);
      return contentList;
    }
    return List<Forum>();
  }

  Future<List<Forum>> getForumByUser() async {
    var response = await http.get(
      '$baseUrl/foros/byUsuario/${storedUserCredentials.userData.email}',
      headers: authHeader,
    );
    print('getforumByUser.statusCode : ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<Forum> contentList = List<Forum>();
      for (var i = 0; i < jsonResponse.length; i++) {
        Forum instance = Forum.fromJson(jsonResponse[i]);
        contentList.add(instance);
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
      "titulo": storedUserCredentials.userData.email,
      "contenido": message,
    };
    var response = await http.post(
      '$baseUrl/mensajes/altaMensaje/${foro.id}/${storedUserCredentials.userData.id}',
      body: jsonEncode(body),
      headers: authHeader,
    );
    return response.statusCode == 200;
  }

  //* SCORE
  Future<double> getCourseScore({Course curso}) async {
    var response = await http.get(
      '$baseUrl/inscripciones/getCalificacionFinal/${curso.id}/${storedUserCredentials.userData.email}',
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
}
