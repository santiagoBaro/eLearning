import 'package:flutter/material.dart';

class MessageHeader extends StatelessWidget {
  const MessageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nombre Persona',
                    style: nameTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ult. vez hoy a las 18:21',
                    style: connectionTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle nameTextStyle = TextStyle(
  fontSize: 23,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

TextStyle connectionTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white60,
);
