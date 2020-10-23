import 'package:flutter/material.dart';

class RecivedMessageBubble extends StatelessWidget {
  const RecivedMessageBubble({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.blueGrey,
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Nombre Usuario',
                    style: nameTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Omnis tempora impedit sunt. Ut quibusdam dolores sunt natus iure. Sapiente alias rem voluptatem quia sed autem adipisci et vitae. Accusantium est tempora quos dolor sint sit. Nihil sunt sunt suscipit esse iure est odio.',
                    style: messageTextStyle,
                  ),
                  Text(
                    '12:22',
                    textAlign: TextAlign.right,
                    style: dateTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle messageTextStyle = TextStyle(
  color: Colors.white60,
  fontSize: 16,
);

TextStyle dateTextStyle = TextStyle(
  color: Colors.white54,
  fontSize: 14,
);

TextStyle nameTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
