import 'package:pushnotifications/elements/massage_header.dart';
import 'package:pushnotifications/elements/recivecd_message_bubble.dart';
import 'package:pushnotifications/elements/sent_message_bubble.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MessageHeader(),
          Expanded(
            child: Container(
              constraints: BoxConstraints(maxWidth: 800),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RecivedMessageBubble(),
                    RecivedMessageBubble(),
                    RecivedMessageBubble(),
                    SentMessageBubble(),
                    RecivedMessageBubble(),
                    SentMessageBubble(),
                  ],
                ),
              ),
            ),
          ),
          // MessageFooter(),
        ],
      ),
    );
  }
}
