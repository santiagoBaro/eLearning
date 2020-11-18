class Task {
  int id;
  bool entregable;
  String date;
  String titulo;
  String instructions;

  Task({
    this.id,
    this.date,
    this.entregable,
    this.instructions,
    this.titulo,
  });

  Task.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        titulo = json['titulo'],
        date = json['fechaLimite'],
        entregable = json['entregable'],
        instructions = json['descripcion'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'entregable': entregable,
        'titulo': titulo,
        'fechaLimite': date,
        'descripcion': instructions,
      };
}

Task taskRelleno = Task(
  id: 1,
  date: "10-11",
  entregable: true,
  titulo: "los panes",
  instructions: "Vitae et quia corporis quia dignissimos dolor tenetur.",
);
