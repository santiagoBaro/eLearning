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

  User({
    this.descripcion,
    this.direccion,
    this.documento,
    this.id,
    this.mail,
    this.carrera,
    this.nombre,
    this.tipoDocumento,
    this.imagen,
    this.tipoUsu,
  });

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
        'nombre': nombre,
        'mail': mail,
        'direccion': direccion,
        'carrera': carrera,
        'tipoDocumento': tipoDocumento,
        'documento': documento,
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
        "Imagen": {"_id": "", "strBase64": "", "nombre": ""}
      };
}

User usuarioRelleno = User(
  id: 342342,
  nombre: "Santiago Baro",
  mail: "sbaro96@gmail.com",
  direccion: "Puyol 1646",
  imagen: "",
  descripcion: "",
  carrera: "tecnoinf",
  tipoDocumento: "ci",
  documento: "4885988-1",
);
