import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:pushnotifications/data_types/user_score.dart';

class ScoreUserList extends StatefulWidget {
  final Course curso;
  ScoreUserList({Key key, @required this.curso}) : super(key: key);

  @override
  _ScoreUserState createState() => _ScoreUserState();
}

class _ScoreUserState extends State<ScoreUserList> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<ScoreUser> displayList = List<ScoreUser>();
  List<ScoreUser> userList = List<ScoreUser>();

  void _filetList(String text) {
    _debouncer.run(() {
      print(text);
      List<ScoreUser> newList;
      if (text != "") {
        newList = userList
            .where((f) => f.mail.startsWith(text.toLowerCase()))
            .toList();
      } else {
        newList = userList;
      }

      setState(() {
        displayList = newList;
      });
      print(displayList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    var client = ApiClient();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: FutureBuilder<List<ScoreUser>>(
            future: client.userScoresCourse(course: widget.curso),
            builder: (BuildContext context,
                AsyncSnapshot<List<ScoreUser>> snapshot) {
              if (snapshot.hasData) {
                userList = snapshot.data;
                if (displayList.length == 0) {
                  displayList = userList;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40,
                      width: 300,
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 8,
                        ),
                        child: TextField(
                            decoration: InputDecoration(hintText: 'Buscar..'),
                            onChanged: (text) => _filetList(text)),
                      ),
                    ),
                    Container(
                      height: 600,
                      width: 600,
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: displayList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TaskUserCard(
                              user: displayList[index],
                            );
                          }),
                    ),
                    ElevatedButton(
                      child: Text("Cancelar"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class TaskUserCard extends StatefulWidget {
  final ScoreUser user;
  final Course curso;
  TaskUserCard({Key key, this.user, this.curso}) : super(key: key);

  @override
  _TaskUserCardState createState() => _TaskUserCardState();
}

class _TaskUserCardState extends State<TaskUserCard> {
  final scoreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null && widget.user.score > 0) {
      scoreController.text = widget.user.score.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(maxWidth: 600),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.user.mail,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: scoreController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var client = ApiClient();
                    bool valid = false;
                    valid = await client.scoreUserCourse(
                        score: scoreController.text,
                        usrMail: widget.user.mail,
                        curso: widget.curso);
                    // valid = await client.scoreTask(
                    //   id: widget.task.id,
                    //   nota: int.parse(scoreController.text),
                    // );
                    if (valid) {
                      showToast('Se cargó la nota correctamente',
                          context: context,
                          animation: StyledToastAnimation.slideFromBottom,
                          reverseAnimation: StyledToastAnimation.slideToBottom,
                          startOffset: Offset(0.0, 3.0),
                          reverseEndOffset: Offset(0.0, 3.0),
                          position: StyledToastPosition.bottom,
                          duration: Duration(seconds: 4),
                          //Animation duration   animDuration * 2 <= duration
                          animDuration: Duration(seconds: 1),
                          curve: Curves.elasticOut,
                          reverseCurve: Curves.fastOutSlowIn);
                    } else {
                      showToast('Error al cargar nota',
                          context: context,
                          animation: StyledToastAnimation.slideFromBottom,
                          reverseAnimation: StyledToastAnimation.slideToBottom,
                          startOffset: Offset(0.0, 3.0),
                          reverseEndOffset: Offset(0.0, 3.0),
                          position: StyledToastPosition.bottom,
                          duration: Duration(seconds: 4),
                          //Animation duration   animDuration * 2 <= duration
                          animDuration: Duration(seconds: 1),
                          curve: Curves.elasticOut,
                          reverseCurve: Curves.fastOutSlowIn);
                    }
                  },
                  child: Text("Guardar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
