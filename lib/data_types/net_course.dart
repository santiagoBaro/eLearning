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
        modalidad = json['modalidad'],
        salaVirtual = json['salaVirtual'],
        actaCreada = json['actaCreada'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'descripcion': descripcion,
        'nombre': nombre,
        'requiereMatriculacion': requiereMatriculacion,
        'modalidad': modalidad,
        'salaVirtual': salaVirtual,
        'actaCreada': actaCreada,
      };
}

// actaCerrada: false
// alumnos: null
// comunicados: null
// cursoId: "b1ecbcdf-e3fe-47a1-b536-55eed324aed3"
// cursoSecciones: null
// descripcion: "Una breve introduccion al campo de la estadistica"
// docentes: null
// modalidad: "Online"
// modalidadId: 0
// nombre: "Probabilidad y Estadistica"
// requiereMatriculacion: false
// salaVirtual: "zoom.com/asdasdasd"
// secciones: null
// templateCurso: null
// templateCursoId: null
