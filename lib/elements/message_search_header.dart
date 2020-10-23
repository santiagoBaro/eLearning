import 'package:flutter/material.dart';

class MessageSearchHeader extends StatefulWidget {
  MessageSearchHeader({Key key}) : super(key: key);

  @override
  _MessageSearchHeaderState createState() => _MessageSearchHeaderState();
}

class _MessageSearchHeaderState extends State<MessageSearchHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(),
            ),
            Center(
              child: FlatButton(
                onPressed: () {},
                child: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
