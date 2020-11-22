import 'package:elearning/data_types/book_element_dataType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class BookElementForm extends StatefulWidget {
  final BookElement element;
  BookElementForm({Key key, this.element}) : super(key: key);

  @override
  _BookElementFormState createState() => _BookElementFormState();
}

class _BookElementFormState extends State<BookElementForm> {
  final _formKey = GlobalKey<FormState>();
  final contentContrller = TextEditingController();
  ElementType dropdownValue = ElementType.title;
  bool isSubmitEnabled = true;
  bool isDeleteEnabled = true;

  @override
  void initState() {
    super.initState();
    if (widget.element != null) {
      contentContrller.text = widget.element.elements.join(',');
      dropdownValue = widget.element.type;
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
                  'content form',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            DropdownButton<ElementType>(
              value: dropdownValue,
              onChanged: (ElementType newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: ElementType.values.map((ElementType classType) {
                return DropdownMenuItem<ElementType>(
                  value: classType,
                  child: Text(classType.toString()),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: contentContrller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(labelText: 'contenido'),
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
                    'cancel',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
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
                        // var client = ApiClient();
                        // valid = await client.delUser(user: widget.usuario);
                        if (valid) {
                          showToast(
                              'el contenido {widget.content} fue eliminado',
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
                          showToast('Error al eliminar contenido',
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
                  visible: (widget.element != null),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate() && isSubmitEnabled) {
                      isSubmitEnabled = false;
                      bool valid = false;
                      // Content nuevoContent = Content(
                      //   color: currentColor.toHex(),
                      //   titulo: nombreContrller.text,
                      // );
                      // var client = ApiClient();
                      // nuevoContent.id = widget.content.id;
                      // valid = await client.updContent(content: nuevoContent);
                      if (valid) {
                        showToast(
                            'el contenido {nuevoContent.titulo} fue editado correctamente',
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
                        showToast('Error al modificar el elemento',
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
