import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/course_dataType.dart';
import 'package:pushnotifications/data_types/task_datatype.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class TaskForm extends StatefulWidget {
  final Task task;
  final Course curso;
  TaskForm({Key key, this.task, @required this.curso}) : super(key: key);

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final titleContrller = TextEditingController();
  final instructionsContrller = TextEditingController();
  bool isEntrega = false;

  bool isSubmitEnabled = true;
  bool isDeleteEnabled = true;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2015),
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
    if (widget.task != null) {
      titleContrller.text = widget.task.titulo;
      instructionsContrller.text = widget.task.instructions;
      isEntrega = widget.task.entregable;
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
                  'Entrega',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: titleContrller,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: instructionsContrller,
                decoration: InputDecoration(labelText: 'Descripción'),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            Row(
              children: [
                Text('Es entrega:'),
                Checkbox(
                  onChanged: (bool value) {
                    setState(() {
                      isEntrega = value;
                    });
                  },
                  value: isEntrega,
                ),
                RaisedButton(
                  onPressed: () => _selectDate(context), // Refer step 3
                  child: Text(
                    DateFormat('yyyy-MM-dd').format(selectedDate),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Color(0xFFFB6107),
                ),
              ],
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
                      Text('Cancelar', style: TextStyle(color: Colors.black45)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200])),
                ),
                Visibility(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (isDeleteEnabled) {
                        isDeleteEnabled = false;
                        if (widget.task != null) {
                          bool valid = false;
                          var client = ApiClient();
                          valid = await client.delTask(
                              curso: widget.curso, task: widget.task);
                          if (valid) {
                            showToast(
                                'La entrega ${widget.task.titulo ?? ""} fue eliminada correctamente',
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
                    child: Text('Eliminar'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent)),
                  ),
                  visible: (widget.task != null),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate() && isSubmitEnabled) {
                      isSubmitEnabled = false;
                      bool valid = false;
                      Task nuevaTask = Task(
                        date: DateFormat('yyyy-MM-dd').format(selectedDate),
                        entregable: isEntrega,
                        instructions: instructionsContrller.text,
                        titulo: titleContrller.text,
                      );
                      var client = ApiClient();
                      if (widget.task != null) {
                        nuevaTask.id = widget.task.id;
                        valid = await client.updTask(task: nuevaTask);
                        if (valid) {
                          showToast(
                              'La entrega ${nuevaTask.titulo} fue editado correctamente',
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
                        valid = await client.addTask(
                            task: nuevaTask, curso: widget.curso);
                        if (valid) {
                          showToast(
                              'La entrega ${nuevaTask.titulo} fue creada correctamente',
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
                  child: Text('Enviar'),
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
