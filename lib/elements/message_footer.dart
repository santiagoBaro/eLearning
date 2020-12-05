import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MessageFooter extends StatefulWidget {
  final Forum foro;
  MessageFooter({Key key, @required this.foro}) : super(key: key);

  @override
  _MessageFooterState createState() => _MessageFooterState();
}

class _MessageFooterState extends State<MessageFooter> {
  bool canSubmit = true;
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
              onPressed: () async {
                canSubmit = false;
                if (messageContrller.text != "") {
                  var client = ApiClient();
                  bool valid = false;
                  valid = await client.addComentFormun(
                    foro: widget.foro,
                    message: messageContrller.text,
                  );
                  if (valid) {
                    showToast('El mensaje fue entregado correctamente',
                        context: context,
                        animation: StyledToastAnimation.slideFromBottom,
                        reverseAnimation: StyledToastAnimation.slideToBottom,
                        startOffset: Offset(0.0, 3.0),
                        reverseEndOffset: Offset(0.0, 3.0),
                        position: StyledToastPosition.bottom,
                        duration: Duration(seconds: 4),
                        //Animation duration   animDuration * 2 <= duration
                        animDuration: Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        reverseCurve: Curves.fastOutSlowIn);
                    Navigator.of(context).pop();
                  } else {
                    showToast('Error al entregar el mensaje',
                        context: context,
                        animation: StyledToastAnimation.slideFromBottom,
                        reverseAnimation: StyledToastAnimation.slideToBottom,
                        startOffset: Offset(0.0, 3.0),
                        reverseEndOffset: Offset(0.0, 3.0),
                        position: StyledToastPosition.bottom,
                        duration: Duration(seconds: 4),
                        //Animation duration   animDuration * 2 <= duration
                        animDuration: Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        reverseCurve: Curves.fastOutSlowIn);
                  }
                }
                canSubmit = true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
