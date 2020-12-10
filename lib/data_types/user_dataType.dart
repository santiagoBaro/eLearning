class User {
  int id;
  String nombre;
  String mail;
  String direccion;
  String imagen;
  String descripcion;
  String carrera;
  String tipoDocumento;
  String documento;
  String tipoUsu;

  User() {
    this.descripcion = "";
    this.direccion = "";
    this.documento = "";
    this.id = -1;
    this.mail = "";
    this.carrera = "";
    this.nombre = "";
    this.tipoDocumento = "";
    this.imagen = "";
    this.tipoUsu = "";
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        nombre = json['nombre'],
        mail = json['mail'],
        direccion = json['direccion'],
        imagen = json['imagen'],
        descripcion = json['descripcion'],
        carrera = json['carrera'] ?? "",
        tipoDocumento = json['tipoDocumento'],
        documento = json['documento'],
        tipoUsu = json['tipoUsu'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'nombre': nombre,
        'mail': mail,
        'direccion': direccion,
        'imagen': imagen,
        'descripcion': descripcion,
        'carrera': carrera,
        'tipoDocumento': tipoDocumento,
        'documento': documento,
        'tipoUsu': tipoUsu
      };

  Map<String, dynamic> toCompleteJson() => {
        'id': id,
        'nombre': nombre,
        'mail': mail,
        'imagen': imagen,
        'direccion': direccion,
        'carrera': carrera,
        'tipoDocumento': tipoDocumento,
        'documento': documento,
        'tipoUsu': tipoUsu,
      };
  Map<String, dynamic> toNestedJson() => {
        "Usuario": {
          "nombre": nombre,
          "mail": mail,
          "imagen": imagen,
          "direccion": direccion,
          "descripcion": descripcion,
          "tipoDocumento": tipoDocumento,
          "documento": documento
        },
      };

  Map<String, dynamic> toNestedValidatedJson(String pass) => {
        "Usuario": {
          "nombre": nombre,
          "mail": mail,
          "imagen": imagen,
          "password": pass,
          "direccion": direccion,
          "descripcion": descripcion,
          "tipoDocumento": tipoDocumento,
          "documento": documento
        },
      };

  static User userFromJSon(Map<String, dynamic> json) {
    User newUser = User();

    newUser.id = json['_id'];
    newUser.nombre = json['nombre'];
    newUser.mail = json['mail'];
    newUser.direccion = json['direccion'];
    newUser.imagen = json['imagen'];
    newUser.descripcion = json['descripcion'];
    newUser.carrera = json['carrera'] ?? "";
    newUser.tipoDocumento = json['tipoDocumento'];
    newUser.documento = json['documento'];
    newUser.tipoUsu = json['tipoUsu'];

    return newUser;
  }

  void clean() {
    this.id = -1;
    this.nombre = "";
    this.mail = "";
    this.direccion = "";
    this.imagen = "";
    this.descripcion = "";
    this.carrera = "";
    this.tipoDocumento = "";
    this.documento = "";
    this.tipoUsu = "";
  }
}
