import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ForoForm extends StatefulWidget {
  final Forum form;
  ForoForm({Key key, this.form}) : super(key: key);

  @override
  _ForoFormState createState() => _ForoFormState();
}

class _ForoFormState extends State<ForoForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final titleContrller = TextEditingController();
  final typeContrller = TextEditingController();

  bool isSubmitEnabled = true;
  bool isDeleteEnabled = true;

  @override
  void initState() {
    super.initState();
    if (widget.form != null) {
      titleContrller.text = widget.form.name;
      typeContrller.text = widget.form.type;
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
        child: Column(
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
                  'entrega form',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: titleContrller,
                decoration: InputDecoration(labelText: 'nombre'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: typeContrller,
                decoration: InputDecoration(labelText: 'nombre'),
                maxLines: null,
                keyboardType: TextInputType.multiline,
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
                  child:
                      Text('cancelar', style: TextStyle(color: Colors.black45)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200])),
                ),
                Visibility(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (isDeleteEnabled) {
                        isDeleteEnabled = false;
                        bool valid = false;
                        var client = ApiClient();
                        valid = await client.delForum(foro: widget.form);
                        if (valid) {
                          showToast(
                              'el foro ${widget.form.name ?? ""} fue eliminada correctamente',
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
                          Navigator.of(context).pop();
                        } else {
                          showToast('Error al eliminar el foro',
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
                        isDeleteEnabled = true;
                      }
                    },
                    child: Text('Delete'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent)),
                  ),
                  visible: (widget.form != null),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate() && isSubmitEnabled) {
                      isSubmitEnabled = false;
                      bool valid = false;
                      Forum nuevoForo = Forum();
                      var client = ApiClient();
                      nuevoForo.id = widget.form.id;
                      if (widget.form != null) {
                        valid = await client.updForum(foro: nuevoForo);
                        if (valid) {
                          showToast(
                              'el foro ${nuevoForo.name} fue editado correctamente',
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
                          Navigator.of(context).pop();
                        } else {
                          showToast('Error al modificar el foro',
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
                      } else {
                        valid = await client.addForum(foro: nuevoForo);
                        if (valid) {
                          showToast(
                              'el foro ${nuevoForo.name} fue creada correctamente',
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
                          Navigator.of(context).pop();
                        } else {
                          showToast('Error al crear el foro',
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
                      }

                      isSubmitEnabled = true;
                    }
                  },
                  child: Text('Submit'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.greenAccent)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
