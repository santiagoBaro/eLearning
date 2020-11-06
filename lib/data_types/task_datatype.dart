class Task {
  String id;
  bool done;
  bool entrega;
  DateTime date;
  String course;
  String instructions;

  Task(
    this.id,
    this.date,
    this.course,
    this.entrega,
    this.instructions,
  );
}
