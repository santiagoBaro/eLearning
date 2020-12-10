import 'package:elearning/data_types/net_section.dart';

class NetCourse {
  String id;
  String descripcion;
  String nombre;
  bool requiereMatriculacion;
  String modalidad;
  String salaVirtual;
  bool actaCreada;
  List<NetSection> secciones;

  NetCourse({
    this.actaCreada,
    this.descripcion,
    this.id,
    this.modalidad,
    this.nombre,
    this.requiereMatriculacion,
    this.salaVirtual,
  });

  NetCourse.fromJson(Map<String, dynamic> json)
      : id = json['cursoId'],
        descripcion = json['descripcion'],
        nombre = json['nombre'],
        requiereMatriculacion = json['requiereMatriculacion'],
        salaVirtual = json['salaVirtual'],
        secciones = parseSections(json['cursoSecciones']),
        actaCreada = json['actaCerrada'];
}

List<NetSection> parseSections(List<dynamic> body) {
  print("parse de sections");
  if (body != null) {
    List<NetSection> courseList = List<NetSection>();
    for (var i = 0; i < body.length; i++) {
      courseList.add(NetSection.fromJson(body[i]));
    }
    print("secciones length: ${courseList.length}");
    return courseList;
  }
  print("Secciones: body vacio");
  return List<NetSection>();
}
