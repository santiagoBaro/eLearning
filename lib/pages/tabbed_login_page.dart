import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/base_app/app_builder.dart';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class TabbedLoginPage extends StatefulWidget {
  TabbedLoginPage({Key key}) : super(key: key);

  @override
  _TabbedLoginPageState createState() => _TabbedLoginPageState();
}

class _TabbedLoginPageState extends State<TabbedLoginPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: Scaffold(
        body: Container(
          //* BACKGROUND
          decoration: tabbedLoginHeaderBoxDecoration,
          child: Column(
            children: [
              Expanded(child: Container()),
              Container(
                constraints: BoxConstraints(maxWidth: 700),
                color: myAppTheme['PrimaryBackgroundColor'],
                height: screenHeight * 0.5,
                child: LoginTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTab extends StatelessWidget {
  //const LoginTab({Key key}) : super(key: key);

  static final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordContrller = TextEditingController();

    return Container(
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Login",
                style: titleTextStyle,
              ),
            ),
            //* USERNAME TEXT FIELD
            Padding(
              padding: tabbedLoginPagging,
              child: TextFormField(
                controller: usernameController,
                style: tabbedLoginInputTextStyle,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  contentPadding: const EdgeInsets.all(15),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor ingresa tu usuario';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: tabbedLoginPagging,
              child: Row(
                children: <Widget>[
                  Expanded(
                    //* PASSWORD TEXT FIELD
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextFormField(
                        controller: passwordContrller,
                        obscureText: true,
                        style: tabbedLoginInputTextStyle,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Contraseña',
                          contentPadding: const EdgeInsets.all(15),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingresa tu contraseña';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  //* LOGIN BUTTON
                  FlatButton(
                    child: Text(
                      'Login',
                      style: tabbedLoginInputTextStyle,
                    ),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: myAppTheme['AccentColor'],
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(15),
                    textColor: myAppTheme['PrimaryActionButtonColor'],
                    onPressed: () async {
                      // //TODO do separate function with checks
                      if (_loginFormKey.currentState.validate()) {
                        bool valid = false;
                        var client = ApiClient();
                        valid = await client.login(
                          username: usernameController.text,
                          password: passwordContrller.text,
                        );
                        if (valid) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LandingPageLayoutBuilder(),
                            ),
                          );
                        } else {
                          showToast('Mail o contraseña incorrectos',
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
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            //* RECOVER PASSWORD
            FlatButton(
              color: Colors.black,
              onPressed: () async {
                if (usernameController.text != "") {
                  bool valid = false;
                  var client = ApiClient();
                  valid = await client.recoverPassword(
                      email: usernameController.text);
                  if (valid) {
                    showToast('Revise su correo',
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
                  } else {
                    showToast('Error al enviar correo',
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
              },
              child: Text(
                "Recuperar contraseña",
                style: hilightTextStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
