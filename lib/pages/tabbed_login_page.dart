import 'package:elearning/base_app/app_builder.dart';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

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
                  hintText: 'Username',
                  contentPadding: const EdgeInsets.all(15),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your username';
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
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.all(15),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
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
                    onPressed: () {
                      // //TODO do separate function with checks
                      if (_loginFormKey.currentState.validate()) {
                        storedUserCredentials
                            .setNickname(usernameController.text);
                        saveUserCredentials();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingPageLayoutBuilder(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            //* RECOVER PASSWORD
            FlatButton(
              color: Colors.black,
              onPressed: () {
                if (_loginFormKey.currentState.validate()) {
                  storedUserCredentials.setNickname(usernameController.text);
                  saveUserCredentials();
                }
              },
              child: Text(
                "Recover password",
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
