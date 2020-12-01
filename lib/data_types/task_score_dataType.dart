import 'package:elearning/data_types/user_dataType.dart';

class TaskScore {
  int id;
  String mailUser;
  String url;
  double score;
  TaskScore({
    this.score,
    this.url,
    this.mailUser,
    this.id,
  });

  TaskScore.fromJson(Map<String, dynamic> json)
      : url = json['linkEntrega'],
        score = json['nota'] ?? 22,
        id = json['id'],
        mailUser = json['mailUsuario'];
}
