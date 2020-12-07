import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/data_types/net_user.dart';
import 'package:elearning/data_types/user_dataType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'change_password_form.dart';

class UserForm extends StatefulWidget {
  final NetUser usuario = storedUserCredentials.userData;
  UserForm({Key key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final nameController = TextEditingController();
  final directionContrller = TextEditingController();
  final apellidosController = TextEditingController();
  final documentController = TextEditingController();
  final telefonoController = TextEditingController();
  final usernameController = TextEditingController();

  bool isSubmitEnabled = true;
  bool isDeleteEnabled = true;

  @override
  void initState() {
    super.initState();
    if (widget.usuario != null) {
      mailController.text = widget.usuario.email;
      nameController.text = widget.usuario.nombres;
      directionContrller.text = widget.usuario.direccion;
      apellidosController.text = widget.usuario.apellidos;
      documentController.text = widget.usuario.ci;
      telefonoController.text = widget.usuario.telefono;
      usernameController.text = widget.usuario.userName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Usuario',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: mailController,
                decoration: InputDecoration(labelText: 'Mail'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: apellidosController,
                decoration: InputDecoration(labelText: 'Dirección'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: directionContrller,
                decoration: InputDecoration(labelText: 'Dirección'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: telefonoController,
                decoration: InputDecoration(labelText: 'Contraseña'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: documentController,
                decoration: InputDecoration(labelText: 'Documento'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Documento'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate() && isSubmitEnabled) {
                      isSubmitEnabled = false;
                      NetUser nuevo_usuario = NetUser(
                        nombres: nameController.text,
                        email: mailController.text,
                        direccion: directionContrller.text,
                        ci: documentController.text,
                        apellidos: apellidosController.text,
                        telefono: telefonoController.text,
                        userName: usernameController.text,
                      );
                      bool valid = false;
                      var client = ApiClient();
                      nuevo_usuario.id = widget.usuario.id;
                      valid = await client.updUser(user: nuevo_usuario);
                      if (valid) {
                        showToast(
                            'El usuario ${nuevo_usuario.nombres} fue editado correctamente',
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
                        showToast('Error al editar el usuario',
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
                  child: Text('Enviar'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.greenAccent)),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          content: Container(
                        constraints: BoxConstraints(
                          maxHeight: 700,
                          maxWidth: 500,
                          minHeight: 200,
                          minWidth: 200,
                        ),
                        child: ChangePassFormm(),
                      ));
                    });
              },
              child: Text('Modificar contraseña',
                  style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.orangeAccent[200])),
            ),
          ],
        ),
      ),
    );
  }
}
