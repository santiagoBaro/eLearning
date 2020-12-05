import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/book_element_dataType.dart';
import 'package:elearning/data_types/content_dataType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MultipleChoiceElementForm extends StatefulWidget {
  final BookElement element;
  final Content content;
  MultipleChoiceElementForm({Key key, this.element, @required this.content})
      : super(key: key);

  @override
  _MultipleChoiceElementFormState createState() =>
      _MultipleChoiceElementFormState();
}

class _MultipleChoiceElementFormState extends State<MultipleChoiceElementForm> {
  final questionContrller = TextEditingController();
  final answerContrller = TextEditingController();
  final optionsContrller = TextEditingController();
  bool isDeleteEnabled = true;
  bool isSubmitEnabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.element != null) {
      if (widget.element.elements.length > 2) {
        questionContrller.text = widget.element.elements[1];
        optionsContrller.text = widget.element.elements[0];
        List<String> lista = widget.element.elements;
        lista = lista.removeAt(0) ?? List<String>();
        optionsContrller.text = lista.removeAt(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: questionContrller,
            decoration: InputDecoration(labelText: 'pregunta'),
          ),
          TextField(
            controller: answerContrller,
            decoration: InputDecoration(labelText: 'indice respuesta'),
          ),
          TextField(
            controller: optionsContrller,
            decoration: InputDecoration(labelText: 'opciones [,]'),
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
                      if (widget.element != null) {
                        bool valid = false;
                        var client = ApiClient();
                        valid = await client.delElement(
                          element: widget.element,
                          content: widget.content,
                        );
                        if (valid) {
                          showToast(
                              'la elemento ${widget.element.type ?? ""} fue eliminado correctamente',
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
                          showToast('Error al eliminar la entrega',
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
                  if (isSubmitEnabled) {
                    isSubmitEnabled = false;
                    bool valid = false;
                    String elem = questionContrller.text +
                        "," +
                        answerContrller.text +
                        "," +
                        optionsContrller.text;
                    BookElement nuevoElement = BookElement(
                        type: "multiple_choice", stringElements: elem);
                    var client = ApiClient();
                    if (widget.element != null) {
                      nuevoElement.id = widget.element.id;
                      valid = await client.updElement(element: nuevoElement);
                      if (valid) {
                        showToast(
                            'la entrega ${nuevoElement.type} fue editado correctamente',
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
                        showToast('Error al modificar la entrega',
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
                      valid = await client.addElement(
                          element: nuevoElement, content: widget.content);
                      if (valid) {
                        showToast(
                            'el elemento ${nuevoElement.type} fue creado correctamente',
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
                        showToast('Error al crear la entrega',
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
    );
  }
}
