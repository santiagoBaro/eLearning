class Course {
  int id;
  String nombre;
  String descripcion;
  int creditos;
  String fechaInicio;

  Course({
    this.creditos,
    this.descripcion,
    this.id,
    this.nombre,
    this.fechaInicio,
  });

  Course.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        nombre = json['nombre'],
        creditos = json['creditos'],
        fechaInicio = json['fechaInicio'],
        descripcion = json['descripcion'];

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'descripcion': descripcion,
        'creditos': creditos,
        'fechaInicio': fechaInicio,
      };

  Map<String, dynamic> toNestedJson() => {
        "Curso": {
          'nombre': nombre,
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
  descripcion: "Et quo suscipit distinctio libero.",
);

class CourseEnrollment {
  Course curso;
  bool isEnrolled;
}
