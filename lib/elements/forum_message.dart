import 'package:elearning/data_types/message_dataType.dart';
import 'package:flutter/material.dart';

class ForumMessage extends StatelessWidget {
  final Message message;
  const ForumMessage({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFB6107),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  message.user.nombre,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(message.contenido),
            ),
          ],
        ),
      ),
    );
  }
}
