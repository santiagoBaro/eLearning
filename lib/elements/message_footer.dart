import 'package:elearning/data_types/foro_dataType.dart';
import 'package:flutter/material.dart';

class MessageFooter extends StatefulWidget {
  final Forum foro;
  MessageFooter({Key key, @required this.foro}) : super(key: key);

  @override
  _MessageFooterState createState() => _MessageFooterState();
}

class _MessageFooterState extends State<MessageFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  textInputAction: TextInputAction.send,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.amberAccent,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
