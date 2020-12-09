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
    this.actividades,
    this.foros,
    this.materiales,
  });

  NetSection.fromJson(Map<String, dynamic> json)
      : id = json['seccionId'],
        nombre = json['seccionData']['nombre'] ?? "",
        descripcion = json['seccionData']['descripcion'] ?? "",
        isDefaul = json['seccionData']['isDefaul'],
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
  String minutosExpiracion;
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
    this.fecha,
    this.minutosExpiracion,
    this.tipo,
    this.url,
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
}

List<NetActividad> parseActividades(List<dynamic> body) {
  if (body != null) {
    List<NetActividad> courseList = List<NetActividad>();
    for (var i = 0; i < body.length; i++) {
      courseList.add(NetActividad.fromJson(body[i]));
    }
    return courseList;
  }
  return List<NetActividad>();
}

class NetForo {
  String id;
  NetForo.fromJson(Map<String, dynamic> json) : id = json['id'];
}

List<NetForo> parseForos(List<dynamic> body) {
  if (body != null) {
    List<NetForo> courseList = List<NetForo>();
    for (var i = 0; i < body.length; i++) {
      courseList.add(NetForo.fromJson(body[i]));
    }
    return courseList;
  }
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
        fileExt = json['fileExt'],
        file = json['archivoData'];
}

List<NetMaterial> parseMateriales(List<dynamic> body) {
  if (body != null) {
    List<NetMaterial> courseList = List<NetMaterial>();
    for (var i = 0; i < body.length; i++) {
      courseList.add(NetMaterial.fromJson(body[i]));
    }
    return courseList;
  }
  return List<NetMaterial>();
}
