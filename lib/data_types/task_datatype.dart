class Task {
  int id;
  bool entrega;
  String date;
  String titulo;
  String instructions;

  Task({
    this.id,
    this.date,
    this.entrega,
    this.instructions,
    this.titulo,
  });

  Task.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        titulo = json['titulo'],
        date = json['fechaLimite'],
        instructions = json['descripcion'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'entrega': entrega,
        'titulo': titulo,
        'fechaLimite': date,
        'descripcion': instructions,
      };
}

Task taskRelleno = Task(
  id: 1,
  date: "10-11",
  entrega: true,
  titulo: "los panes",
  instructions: "Vitae et quia corporis quia dignissimos dolor tenetur.",
);
