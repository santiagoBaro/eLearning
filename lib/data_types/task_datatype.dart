class Task {
  int id;
  bool done;
  bool entrega;
  String date;
  String titulo;
  String course;
  String instructions;

  Task({
    this.id,
    this.date,
    this.course,
    this.entrega,
    this.instructions,
    this.done,
    this.titulo,
  });

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        done = json['done'],
        entrega = json['entrega'],
        titulo = json['titulo'],
        date = json['date'],
        course = json['course'],
        instructions = json['instructions'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'done': done,
        'entrega': entrega,
        'titulo': titulo,
        'date': date,
        'course': course,
        'instructions': instructions,
      };
}

Task taskRelleno = Task(
  id: 1,
  date: "10-11",
  course: "Programacion",
  entrega: true,
  done: false,
  titulo: "los panes",
  instructions: "Vitae et quia corporis quia dignissimos dolor tenetur.",
);
