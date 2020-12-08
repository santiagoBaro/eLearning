import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/data_types/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CursoForm extends StatefulWidget {
  final Course curso;
  CursoForm({Key key, this.curso}) : super(key: key);

  @override
  _CursoFormState createState() => _CursoFormState();
}

class _CursoFormState extends State<CursoForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final nombreContrller = TextEditingController();
  final creditosContrller = TextEditingController();
  final descripcionContrller = TextEditingController();
  Color currentColor = Colors.limeAccent;
  void changeColor(Color color) => setState(() => currentColor = color);

  bool isSubmitEnabled = true;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void initState() {
    super.initState();
    if (widget.curso != null) {
      nombreContrller.text = widget.curso.nombre;
      creditosContrller.text = widget.curso.creditos.toString();
      descripcionContrller.text = widget.curso.descripcion;
      // currentColor =
      //     HexColor.fromHex(widget.curso.descripcion); //widget.curso.color;
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
                  'Curso',
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
              child: TextFormField(
                controller: creditosContrller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Créditos'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: descripcionContrller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Descripción'),
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
            RaisedButton(
              onPressed: () => _selectDate(context), // Refer step 3
              child: Text(
                'Fecha de inicio - ' +
                    DateFormat('yyyy-MM-dd').format(selectedDate),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              color: Color(0xFFFB6107),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    nombreContrller.text = widget.curso.nombre;
                    creditosContrller.text = widget.curso.creditos.toString();
                    descripcionContrller.text = widget.curso.descripcion;
                    selectedDate = DateFormat("yyyy-MM-dd")
                        .parse(widget.curso.fechaInicio);
                  },
                  child: Text('Descartar cambios',
                      style: TextStyle(color: Colors.black45)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200])),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate() && isSubmitEnabled) {
                      isSubmitEnabled = false;
                      bool valid = false;
                      Course nuevoCurso = Course(
                        creditos: int.parse(creditosContrller.text),
                        nombre: nombreContrller.text,
                        color: currentColor.toString(),
                        descripcion: descripcionContrller.text,
                        fechaInicio:
                            DateFormat('yyyy-MM-dd').format(selectedDate),
                      );
                      ApiClient client = ApiClient.getInstance();
                      nuevoCurso.id = widget.curso.id;
                      valid = await client.updCourse(course: nuevoCurso);
                      if (valid) {
                        showToast(
                            'El curso ${nuevoCurso.nombre} fue editado correctamente',
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
                        showToast('Error al modificar el curso',
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
                  child: Text('Actualizar'),
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
