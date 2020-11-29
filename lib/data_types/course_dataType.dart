import 'dart:ui';

import 'hex_color.dart';

class Course {
  int id;
  String nombre;
  String descripcion;
  String color;
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
      : id = json['_id'] ?? 0,
        nombre = json['nombre'] ?? "",
        color = json['color'] ?? "0xFF005377",
        creditos = json['creditos'] ?? 0,
        fechaInicio = json['fechaInicio'] ?? "",
        descripcion = json['descripcion'] ?? "";

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'descripcion': descripcion,
        'color': color,
        'creditos': creditos,
        'fechaInicio': fechaInicio,
      };

  Map<String, dynamic> toNestedJson() => {
        "Curso": {
          'nombre': nombre,
          'descripcion': descripcion,
          'creditos': creditos,
          'fechaInicio': fechaInicio,
          'color': color,
        }
      };
}

Course courseRelleno = Course(
  id: 22,
  nombre: "Programacion",
  creditos: 12,
  color: "0xFF8D9EC6",
  descripcion: "Et quo suscipit distinctio libero.",
);

class CourseEnrollment {
  Course curso;
  bool isEnrolled;
}
