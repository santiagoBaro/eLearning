import 'dart:ui';

import 'hex_color.dart';

class Course {
  int id;
  String nombre;
  String descripcion;
  Color color;
  int creditos;
  String fechaInicio;

  Course({
    this.color,
    this.creditos,
    this.descripcion,
    this.id,
    this.nombre,
    this.fechaInicio,
  });

  Course.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        nombre = json['nombre'],
        color = HexColor.fromHex(json['color']),
        creditos = json['creditos'],
        fechaInicio = json['fechaInicio'],
        descripcion = json['descripcion'];

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'descripcion': descripcion,
        'color': color.toHex(),
        'creditos': creditos,
        'fechaInicio': fechaInicio,
      };

  Map<String, dynamic> toNestedJson() => {
        "Curso": {
          'nombre': nombre,
          'color': color.toHex(),
          'descripcion': descripcion,
          'creditos': creditos,
          'fechaInicio': fechaInicio,
        }
      };
}

Course courseRelleno = Course(
  id: 4534534,
  nombre: "Programacion",
  creditos: 12,
  color: Color(0xFF8D9EC6),
  descripcion: "Et quo suscipit distinctio libero.",
);

class CourseEnrollment {
  Course curso;
  bool isEnrolled;
}
