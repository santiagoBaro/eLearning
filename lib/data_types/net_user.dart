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

  NetUser({
    this.apellidos,
    this.ci,
    this.direccion,
    this.email,
    this.id,
    this.nombres,
    this.telefono,
    this.userName,
    this.tipo,
  });

  NetUser.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "",
        nombres = json['nombres'] ?? "",
        apellidos = json['apellidos'] ?? "",
        ci = json['ci'] ?? "",
        direccion = json['direccion'] ?? "",
        email = json['email'] ?? "",
        tipo = json['tipo'] ?? "",
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
        'telefono': telefono,
        'userName': userName,
      };
}
