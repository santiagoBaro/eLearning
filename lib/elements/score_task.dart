import 'dart:async';

import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/base_app/firebase_download_file.dart';
import 'package:elearning/data_types/task_datatype.dart';
import 'package:elearning/data_types/task_score_dataType.dart';
import 'package:flutter/material.dart';

class ScoreTasks extends StatefulWidget {
  final Task tarea;
  ScoreTasks({Key key, this.tarea}) : super(key: key);

  @override
  _ScoreTaskState createState() => _ScoreTaskState();
}

class _ScoreTaskState extends State<ScoreTasks> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<TaskScore> displayList = List<TaskScore>();
  List<TaskScore> userList = List<TaskScore>();

  void _filetList(String text) {
    _debouncer.run(() {
      print(text);
      List<TaskScore> newList;
      if (text != "") {
        newList = userList
            .where((f) => f.mailUser.startsWith(text.toLowerCase()))
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
          child: FutureBuilder<List<TaskScore>>(
            future: client.getTaskScoresByTask(tarea: widget.tarea),
            builder: (BuildContext context,
                AsyncSnapshot<List<TaskScore>> snapshot) {
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
                            decoration: InputDecoration(
                                hintText: 'Enter a search term'),
                            onChanged: (text) => _filetList(text)),
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 600,
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: displayList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TaskScoreCard(
                              task: displayList[index],
                            );
                          }),
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

class TaskScoreCard extends StatefulWidget {
  final TaskScore task;
  TaskScoreCard({Key key, this.task}) : super(key: key);

  @override
  _TaskScoreCardState createState() => _TaskScoreCardState();
}

class _TaskScoreCardState extends State<TaskScoreCard> {
  final scoreController = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (widget.task != null) {
  //     scoreController.text = widget.task.score.toString();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              widget.task.mailUser,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                child: FirebaseDownloadButton(),
                visible: widget.task.url != "",
              ),
              Container(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: scoreController,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Save"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
