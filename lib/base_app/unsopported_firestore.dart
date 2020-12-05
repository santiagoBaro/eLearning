import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class FirebaseUploadFileButton extends StatefulWidget {
  final String direcorty;
  final Function(String) fbUrl;
  FirebaseUploadFileButton(
      {Key key, @required this.direcorty, @required this.fbUrl})
      : super(key: key);

  @override
  _FirebaseUploadFileButtonState createState() =>
      _FirebaseUploadFileButtonState();
}

class _FirebaseUploadFileButtonState extends State<FirebaseUploadFileButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showToast('El dispositivo no soporta esta funcionalidad',
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
          },
          child: Text("Subir Archivo"),
        ),
      ],
    );
  }
}

class FirebaseDownloadButton extends StatefulWidget {
  final String url;
  FirebaseDownloadButton({Key key, @required this.url}) : super(key: key);

  @override
  _FirebaseDownloadButtonState createState() => _FirebaseDownloadButtonState();
}

class _FirebaseDownloadButtonState extends State<FirebaseDownloadButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showToast('El dispositivo no soporta esta funcionalidad',
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
      },
      child: Text("Descargar Archivo"),
    );
  }
}
