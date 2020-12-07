import 'dart:io';

class NetSection {
  String id;
  String nombre;
  String descripcion;
  bool isDefaul;
  bool isVisible;

  NetSection({
    this.descripcion,
    this.id,
    this.isDefaul,
    this.isVisible,
    this.nombre,
  });

  NetSection.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nombre = json['nombre'],
        descripcion = json['descripcion'],
        isDefaul = json['isDefaul'],
        isVisible = json['isVisible'];

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
  String descripcion;

  NetActividad({
    this.descripcion,
    this.fechaFinalizada,
    this.fechaRealizada,
    this.id,
    this.nombre,
  });

  NetActividad.fromJson(Map<String, dynamic> json)
      : descripcion = json['descripcion'],
        fechaFinalizada = json['fechaFinalizada'],
        fechaRealizada = json['fechaRealizada'],
        id = json['id'],
        nombre = json['nombre'];

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
  File file;

  NetMaterial({this.file, this.id});

  NetMaterial.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        file = json['file'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'file': file,
      };
}
