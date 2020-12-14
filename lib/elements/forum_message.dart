import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/message_dataType.dart';
import 'package:flutter/material.dart';

class ForumMessage extends StatefulWidget {
  final Message message;
  ForumMessage({Key key, @required this.message}) : super(key: key);

  @override
  _ForumMessageState createState() => _ForumMessageState();
}

class _ForumMessageState extends State<ForumMessage> {
  @override
  Widget build(BuildContext context) {
    final modMsgController = TextEditingController();
    modMsgController.text = widget.message.contenido;

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
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.message.user.nombre,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: storedUserCredentials.userData.mail ==
                              widget.message.user.mail ||
                          storedUserCredentials.userData.tipoUsu == "D",
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    height: 150,
                                    constraints: BoxConstraints(
                                      maxWidth: 500,
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: modMsgController,
                                          ),
                                        ),
                                        ElevatedButton(
                                          child: Text("Modificar"),
                                          onPressed: () async {
                                            var client = ApiClient();
                                            bool valid = false;
                                            widget.message.contenido =
                                                modMsgController.text;
                                            valid = await client.updMsg(
                                                mesage: widget.message);
                                            if (valid) {
                                              showToast(
                                                  'El mensaje fue modificado correctamente',
                                                  context: context,
                                                  animation:
                                                      StyledToastAnimation
                                                          .slideFromBottom,
                                                  reverseAnimation:
                                                      StyledToastAnimation
                                                          .slideToBottom,
                                                  startOffset: Offset(0.0, 3.0),
                                                  reverseEndOffset:
                                                      Offset(0.0, 3.0),
                                                  position: StyledToastPosition
                                                      .bottom,
                                                  duration:
                                                      Duration(seconds: 4),
                                                  //Animation duration   animDuration * 2 <= duration
                                                  animDuration:
                                                      Duration(seconds: 1),
                                                  curve: Curves.elasticOut,
                                                  reverseCurve:
                                                      Curves.fastOutSlowIn);
                                              Navigator.of(context).pop();
                                            } else {
                                              showToast(
                                                  'Error al modificar mensaje',
                                                  context: context,
                                                  animation:
                                                      StyledToastAnimation
                                                          .slideFromBottom,
                                                  reverseAnimation:
                                                      StyledToastAnimation
                                                          .slideToBottom,
                                                  startOffset: Offset(0.0, 3.0),
                                                  reverseEndOffset:
                                                      Offset(0.0, 3.0),
                                                  position: StyledToastPosition
                                                      .bottom,
                                                  duration:
                                                      Duration(seconds: 4),
                                                  //Animation duration   animDuration * 2 <= duration
                                                  animDuration:
                                                      Duration(seconds: 1),
                                                  curve: Curves.elasticOut,
                                                  reverseCurve:
                                                      Curves.fastOutSlowIn);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Text("Modificar"),
                      ),
                    ),
                    Visibility(
                      visible: storedUserCredentials.userData.mail ==
                              widget.message.user.mail ||
                          storedUserCredentials.userData.tipoUsu == "D",
                      child: ElevatedButton(
                        onPressed: () async {
                          var client = ApiClient();
                          bool valid = false;
                          valid = await client.delMsg(mesage: widget.message);
                          if (valid) {
                            showToast('El mensaje fue eliminado correctamente',
                                context: context,
                                animation: StyledToastAnimation.slideFromBottom,
                                reverseAnimation:
                                    StyledToastAnimation.slideToBottom,
                                startOffset: Offset(0.0, 3.0),
                                reverseEndOffset: Offset(0.0, 3.0),
                                position: StyledToastPosition.bottom,
                                duration: Duration(seconds: 4),
                                //Animation duration   animDuration * 2 <= duration
                                animDuration: Duration(seconds: 1),
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.fastOutSlowIn);
                          } else {
                            showToast('Error al eliminar mensaje',
                                context: context,
                                animation: StyledToastAnimation.slideFromBottom,
                                reverseAnimation:
                                    StyledToastAnimation.slideToBottom,
                                startOffset: Offset(0.0, 3.0),
                                reverseEndOffset: Offset(0.0, 3.0),
                                position: StyledToastPosition.bottom,
                                duration: Duration(seconds: 4),
                                //Animation duration   animDuration * 2 <= duration
                                animDuration: Duration(seconds: 1),
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.fastOutSlowIn);
                          }
                        },
                        child: Text("Eliminar"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(widget.message.contenido),
            ),
          ],
        ),
      ),
    );
  }
}
