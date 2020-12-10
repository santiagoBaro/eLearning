class NetSection {
  String id;
  String nombre;
  String descripcion;
  bool isDefault;
  bool isVisible;
  List<NetForo> foros;
  List<NetMaterial> materiales;
  List<NetActividad> actividades;

  NetSection({
    this.descripcion,
    this.id,
    this.isDefault,
    this.isVisible,
    this.nombre,
    this.actividades,
    this.foros,
    this.materiales,
  });

  NetSection.fromJson(Map<String, dynamic> json)
      : id = json['seccionId'],
        nombre = json['seccionData']['nombre'] ?? "",
        descripcion = json['seccionData']['descripcion'] ?? "",
        isDefault = json['seccionData']['isDefault'],
        isVisible = json['seccionData']['isVisible'],
        foros = parseForos(json['foroLista']),
        materiales = parseMateriales(json['materialLista']),
        actividades = parseActividades(json['actividadLista']);
}

class NetActividad {
  String id;
  String fechaRealizada;
  String fechaFinalizada;
  String nombre;
  String descripcion;
  String tipo;

  NetActividad({
    this.descripcion,
    this.fechaFinalizada,
    this.fechaRealizada,
    this.id,
    this.nombre,
    this.tipo,
  });

  NetActividad.fromJson(Map<String, dynamic> json)
      : tipo = json['tipo'],
        id = json['actividad']['actividadId'] ?? "",
        descripcion = json['actividad']['descripcion'] ?? "",
        fechaFinalizada = json['actividad']['fechaFinalizada'] ?? "",
        fechaRealizada = json['actividad']['fechaRealizada'] ?? "",
        nombre = json['actividad']['nombre'] ?? "";
}

List<NetActividad> parseActividades(List<dynamic> body) {
  print("parse de actividades");
  if (body != null) {
    List<NetActividad> courseList = List<NetActividad>();
    for (var i = 0; i < body.length; i++) {
      print(" -  - $i");
      courseList.add(NetActividad.fromJson(body[i]));
    }
    print(" - actividadactividadeses length: ${courseList.length}");
    return courseList;
  }
  print(" - Actividades: body vacio");
  return List<NetActividad>();
}

class NetForo {
  String id;
  NetForo.fromJson(Map<String, dynamic> json) : id = json['id'];
}

List<NetForo> parseForos(List<dynamic> body) {
  print("parse de foros");
  if (body != null) {
    List<NetForo> courseList = List<NetForo>();
    for (var i = 0; i < body.length; i++) {
      courseList.add(NetForo.fromJson(body[i]));
    }
    print(" - foros length: ${courseList.length}");
    return courseList;
  }
  print(" - Foros: body vacio");
  return List<NetForo>();
}

class NetMaterial {
  String id;
  String file;
  String nombre;
  String descripcion;
  String fileExt;
  String fileNom;

  NetMaterial({
    this.file,
    this.id,
    this.descripcion,
    this.fileExt,
    this.fileNom,
    this.nombre,
  });

  NetMaterial.fromJson(Map<String, dynamic> json)
      : id = json['materialId'],
        nombre = json['nombre'],
        descripcion = json['descripcion'],
        fileNom = json['archivoNombre'],
        fileExt = json['archivoExtension'],
        file = json['archivoData'];
}

List<NetMaterial> parseMateriales(List<dynamic> body) {
  print("parse de materiales");
  if (body != null) {
    List<NetMaterial> courseList = List<NetMaterial>();
    for (var i = 0; i < body.length; i++) {
      courseList.add(NetMaterial.fromJson(body[i]));
    }
    print(" - Materiales length: ${courseList.length}");
    return courseList;
  }
  print(" - Materiales: body vacio");
  return List<NetMaterial>();
}
