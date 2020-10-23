import 'package:flutter/material.dart';

class SentMessageBubble extends StatelessWidget {
  const SentMessageBubble({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(23),
                topLeft: Radius.circular(23),
                bottomLeft: Radius.circular(23),
              ),
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Omnis tempora impedit sunt. Ut quibusdam dolores sunt natus iure. Sapiente alias rem voluptatem quia sed autem adipisci et vitae. Accusantium est tempora quos dolor sint sit. Nihil sunt sunt suscipit esse iure est odio.',
                    style: messageTextStyle,
                  ),
                  Text(
                    '12:22',
                    textAlign: TextAlign.left,
                    style: dateTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

TextStyle messageTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 16,
);

TextStyle dateTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 14,
);
