import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:flutter/material.dart';

class MessageFooter extends StatefulWidget {
  final Forum foro;
  MessageFooter({Key key, @required this.foro}) : super(key: key);

  @override
  _MessageFooterState createState() => _MessageFooterState();
}

class _MessageFooterState extends State<MessageFooter> {
  final messageContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: messageContrller,
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
              onPressed: () {
                if (messageContrller.text != "") {
                  var client = ApiClient();
                  client.addComentFormun(
                    foro: widget.foro,
                    message: messageContrller.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
