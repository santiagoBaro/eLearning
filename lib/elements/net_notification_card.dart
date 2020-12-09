import 'package:elearning/data_types/foro_dataType.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';
import 'package:elearning/data_types/net_section.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:elearning/base_app/api_client.dart';

import 'forum_message.dart';
import 'message_footer.dart';

class NotificationCard extends StatefulWidget {
  final NetForo foro;
  NotificationCard({Key key, @required this.foro}) : super(key: key);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      constraints: BoxConstraints(
        minWidth: 300,
        maxWidth: 600,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                // return _buildPopUp(foro: widget.foro);
              });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NotificationCardHeader(foro: widget.foro),
            Expanded(
              child: NitificationCardBody(
                foro: widget.foro,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCardHeader extends StatelessWidget {
  final NetForo foro;
  const NotificationCardHeader({Key key, this.foro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          SizedBox(width: 50),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* FORUM TITLE
                Text(
                  // foro.name ??
                  "Nombre vacío",
                  style: courseNameTextStyle,
                ),
                //* FORUM TYPE
                Text(
                  // foro.type ??
                  "Tipo vacío",
                  style: userNameTextStyle,
                ),
              ],
            ),
          ),
          //* DATE
          Text(
            _buildDate("foro.date"),
            style: courseNameTextStyle,
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class NitificationCardBody extends StatelessWidget {
  final NetForo foro;
  const NitificationCardBody({Key key, this.foro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "_getMessage(foro)",
          style: bodyTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: null,
        ),
      ),
    );
  }
}

TextStyle courseNameTextStyle = TextStyle(
  fontSize: 18,
  color: myAppTheme['SecondaryTextColor'],
  fontWeight: FontWeight.bold,
);

TextStyle userNameTextStyle = TextStyle(
  color: myAppTheme['PrimaryTextColor'],
);

TextStyle bodyTextStyle = TextStyle(
  color: myAppTheme['SecondaryTextColor'],
);

String _buildDate(String date) {
  String base = date.split("T")[0];
  var elem = base.split("-");
  return "${elem[1]}/${elem[2]}";
}

String _getMessage(Forum foro) {
  if (foro.messages == null || foro.messages.length == 0) {
    return "";
  }
  return foro.messages[0].contenido;
}

Widget _buildPopUp({@required NetForo foro}) {
  return AlertDialog(
    content: Container(
      constraints: BoxConstraints(
        maxHeight: 700,
        maxWidth: 500,
        minHeight: 200,
        minWidth: 200,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NotificationCardHeader(foro: foro),
          Expanded(
            child: Container(
              height: 500,
              width: 400,
              // child: ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: 0,
              //   itemBuilder: (BuildContext context, int index) {
              //     return ForumMessage(
              //       message: foro.messages[index],
              //     );
              //   },
              // ),
            ),
          ),
          MessageFooter(foro: foro),
        ],
      ),
    ),
  );
}

class MessageFooter extends StatefulWidget {
  final NetForo foro;
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
                  // valid = await client.addComentFormun(
                  //   foro: widget.foro,
                  //   message: messageContrller.text,
                  // );
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
