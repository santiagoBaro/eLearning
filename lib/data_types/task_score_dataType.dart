import 'package:elearning/data_types/user_dataType.dart';

class TaskScore {
  int id;
  int taskId;
  String mailUser;
  String url;
  double score;
  TaskScore({
    this.score,
    this.url,
    this.mailUser,
    this.id,
    this.taskId,
  });

  TaskScore.fromJson(Map<String, dynamic> json)
      : url = json['linkEntrega'],
        score = json['nota'],
        id = json['id'],
        taskId = json['idTarea'],
        mailUser = json['mailUsuario'];
}
