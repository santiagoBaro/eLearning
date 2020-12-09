import 'package:pushnotifications/elements/message_card.dart';
import 'package:pushnotifications/elements/message_search_header.dart';
import 'package:flutter/material.dart';

class MessagesListPage extends StatelessWidget {
  const MessagesListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MessageSearchHeader(),
            MessageCard(),
            MessageCard(),
            MessageCard(),
            MessageCard(),
            MessageCard(),
          ],
        ),
      ),
    );
  }
}
