class Forum {
  int id;
  String title;
  String date;
  String type;
  Forum({
    this.id,
    this.date,
    this.title,
    this.type,
  });

  Forum.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        title = json['title'],
        date = json['date'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'date': date,
        'type': type,
      };
}

Forum formRelleno = Forum(
  id: 0,
  date: "9/11",
  title: "titulo de foro",
  type: "novedades",
);
