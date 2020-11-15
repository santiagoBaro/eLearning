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
  });

  Forum.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['nombre'],
        date = json['fecha'],
        type = json['tipo'],
        messages = fromJsonList(json['mensajes']);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'nombre': name,
        'fecha': date,
        'tipo': type,
      };
}

Forum formRelleno = Forum(
  id: 0,
  date: "9/11",
  name: "titulo de foro",
  type: "novedades",
);
