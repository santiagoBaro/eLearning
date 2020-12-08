import 'dart:io';

class NetSection {
  String id;
  String nombre;
  String descripcion;
  bool isDefaul;
  bool isVisible;
  List<NetForo> foros;
  List<NetMaterial> materiales;
  List<NetActividad> actividades;

  NetSection({
    this.descripcion,
    this.id,
    this.isDefaul,
    this.isVisible,
    this.nombre,
  });

  NetSection.fromJson(Map<String, dynamic> json)
      : id = json['seccionId'],
        nombre = json['seccionData']['nombre'] ?? "",
        descripcion = json['seccionData']['descripcion'] ?? "",
        isDefaul = json['seccionData']['isDefaul'],
        isVisible = json['seccionData']['isVisible'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'descripcion': descripcion,
        'isDefaul': isDefaul,
        'isVisible': isVisible,
      };
}

class NetActividad {
  String id;
  DateTime fechaRealizada;
  DateTime fechaFinalizada;
  String nombre;
  int minutosExpiracion;
  String fecha;
  String descripcion;
  String tipo;
  String url;

  NetActividad({
    this.descripcion,
    this.fechaFinalizada,
    this.fechaRealizada,
    this.id,
    this.nombre,
  });

  NetActividad.fromJson(Map<String, dynamic> json)
      : tipo = json['tipo'],
        id = json['actividad']['actividadId'] ?? "",
        fecha = json['actividad']['fecha'] ?? "",
        descripcion = json['actividad']['descripcion'] ?? "",
        fechaFinalizada = json['actividad']['fechaFinalizada'] ?? "",
        fechaRealizada = json['actividad']['fechaRealizada'] ?? "",
        nombre = json['actividad']['nombre'] ?? "",
        url = json['actividad']['url'] ?? "",
        minutosExpiracion = json['actividad']['minutosExpiracion'] ?? "";

  Map<String, dynamic> toJson() => {
        'id': id,
        'descripcion': descripcion,
        'nombre': nombre,
        'fechaFinalizada': fechaFinalizada,
        'fechaRealizada': fechaRealizada,
      };
}

class NetForo {}

class NetMaterial {
  String id;
  String file;
  String nombre;
  String descripcion;
  String fileExt;
  String fileNom;

  NetMaterial({this.file, this.id});

  NetMaterial.fromJson(Map<String, dynamic> json)
      : id = json['materialId'],
        nombre = json['nombre'],
        descripcion = json['descripcion'],
        fileNom = json['archivoNombre'],
        fileExt = json['fileExt'],
        file = json['archivoData'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'file': file,
      };
}
