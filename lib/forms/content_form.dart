import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/content_dataType.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ContentForm extends StatefulWidget {
  final Content content;
  final Course curso;
  ContentForm({Key key, this.content, @required this.curso}) : super(key: key);

  @override
  _ContentFormState createState() => _ContentFormState();
}

class _ContentFormState extends State<ContentForm> {
  final _formKey = GlobalKey<FormState>();
  final nombreContrller = TextEditingController();

  Color currentColor = Colors.limeAccent;
  void changeColor(Color color) => setState(() => currentColor = color);

  bool isSubmitEnabled = true;
  bool isDeleteEnabled = true;
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    if (widget.content != null) {
      nombreContrller.text = widget.content.titulo;
      // currentColor = HexColor.fromHex(widget.content.color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 700,
        maxWidth: 500,
        minHeight: 200,
        minWidth: 200,
      ),
      child: Form(
        key: _formKey,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFB6107),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Contenido',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    controller: nombreContrller,
                    decoration: InputDecoration(labelText: 'Nombre'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 120),
                    child: MaterialPicker(
                      pickerColor: currentColor,
                      onColorChanged: changeColor,
                      enableLabel: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[200])),
                    ),
                    Visibility(
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isWaiting = true;
                          });
                          if (isDeleteEnabled) {
                            isDeleteEnabled = false;
                            bool valid = false;
                            var client = ApiClient();
                            valid = await client.delContent(
                                content: widget.content);
                            if (valid) {
                              showToast(
                                  'El contenido ${widget.content.titulo ?? ""} fue eliminado',
                                  context: context,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
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
                              Navigator.of(context).pop();
                            } else {
                              showToast('Error al eliminar contenido',
                                  context: context,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
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
                            isDeleteEnabled = true;
                          }
                          setState(() {
                            isWaiting = false;
                          });
                        },
                        child: Text('Eliminar'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.redAccent)),
                      ),
                      visible: (widget.content != null),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isWaiting = true;
                        });
                        if (_formKey.currentState.validate() &&
                            isSubmitEnabled) {
                          isSubmitEnabled = false;
                          bool valid = false;
                          Content nuevoContent = Content(
                            color: currentColor.toString(),
                            titulo: nombreContrller.text,
                          );
                          var client = ApiClient();
                          if (widget.content != null) {
                            nuevoContent.id = widget.content.id;
                            valid = await client.updContent(
                                content: nuevoContent, curso: widget.curso);
                            if (valid) {
                              showToast(
                                  'El contenido ${nuevoContent.titulo} fue editado correctamente',
                                  context: context,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
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
                              Navigator.of(context).pop();
                            } else {
                              showToast('Error al modificar el curso',
                                  context: context,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
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
                          } else {
                            valid = await client.addContent(
                                content: nuevoContent, curso: widget.curso);
                            if (valid) {
                              showToast(
                                  'El contenido ${nuevoContent.titulo} fue agregado correctamente',
                                  context: context,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
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
                              Navigator.of(context).pop();
                            } else {
                              showToast('Error al agregar el curso',
                                  context: context,
                                  animation:
                                      StyledToastAnimation.slideFromBottom,
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
                          }

                          isSubmitEnabled = true;
                        }
                        setState(() {
                          isWaiting = false;
                        });
                      },
                      child: Text('Enviar'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.greenAccent)),
                    ),
                  ],
                ),
              ],
            ),
            Positioned.fill(
              child: Visibility(
                visible: isWaiting,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
