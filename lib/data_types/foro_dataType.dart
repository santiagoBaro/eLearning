import 'message_dataType.dart';

class Forum {
  int id;
  String name;
  String date;
  String type;
  List<Message> messages;
  Forum({
    this.id,
    this.date,
    this.name,
    this.type,
    this.messages,
  });

  Forum.fromJson(Map<String, dynamic> json)
      : id = json['_id'] ?? 0,
        name = json['nombre'] ?? "",
        date = json['fecha'] ?? "",
        type = json['tipo'] ?? "",
        messages = fromJsonList(json['mensajes']) ?? List<Message>();

  Map<String, dynamic> toJson() => {
        'nombre': name,
        'tipo': type,
        'fecha': date,
      };
}

Forum formRelleno = Forum(
  id: 0,
  date: "9-11-2020Tsdasds",
  name: "titulo de foro",
  type: "novedades",
  messages: List<Message>(),
);
