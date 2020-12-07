class NetUser {
  String id;
  String nombres;
  String apellidos;
  String ci;
  String tipo;
  String email;
  String direccion;
  String telefono;
  String userName;
  String password;

  NetUser({
    this.apellidos,
    this.ci,
    this.direccion,
    this.email,
    this.id,
    this.nombres,
    this.password,
    this.telefono,
    this.userName,
    this.tipo,
  });

  NetUser.fromJson(Map<String, dynamic> json)
      : apellidos = json['apellidos'] ?? "",
        ci = json['ci'] ?? "",
        direccion = json['direccion'] ?? "",
        email = json['email'] ?? "",
        id = json['id'] ?? "",
        tipo = json['tipo'] ?? "",
        nombres = json['nombres'] ?? "",
        password = json['password'] ?? "",
        telefono = json['telefono'] ?? "",
        userName = json['userName'] ?? "";

  Map<String, dynamic> toJson() => {
        'apellidos': apellidos,
        'ci': ci,
        'direccion': direccion,
        'email': email,
        'id': id,
        'tipo': tipo,
        'nombres': nombres,
        'password': password,
        'telefono': telefono,
        'userName': userName,
      };
}
