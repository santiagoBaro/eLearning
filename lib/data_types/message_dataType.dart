import 'package:pushnotifications/data_types/user_dataType.dart';

class Message {
  int id;
  User user;
  int idForo;
  String titulo;
  String contenido;

  Message({
    this.id,
    this.contenido,
    this.idForo,
    this.titulo,
    this.user,
  });

  Message.fromJson(Map<String, dynamic> json)
      : id = json['_id'] ?? 0,
        titulo = json['titulo'] ?? "",
        contenido = json['contenido'] ?? "",
        user = User.fromJson(json['usuario']) ?? User(),
        idForo = json['foro'] ?? 0;
}

List<Message> fromJsonList(List<dynamic> json) {
  List<Message> messageList = List<Message>();
  for (var i = 0; i < json.length; i++) {
    messageList.add(Message.fromJson(json[i]));
  }
  return messageList;
}
