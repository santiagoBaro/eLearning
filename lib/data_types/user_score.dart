class ScoreUser {
  String mail;
  double score;

  ScoreUser({this.mail, this.score});

  ScoreUser.fromJson(Map<String, dynamic> json)
      : mail = json['mail'],
        score = json['nota'];
}
