import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/base_app/app_builder.dart';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class TabbedLoginPage extends StatefulWidget {
  final int initialIndex;
  TabbedLoginPage({Key key, this.initialIndex = 0}) : super(key: key);

  @override
  _TabbedLoginPageState createState() => _TabbedLoginPageState();
}

class _TabbedLoginPageState extends State<TabbedLoginPage>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    _nestedTabController.index = widget.initialIndex;
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Scaffold(
        body: Container(
          //* BACKGROUND
          decoration: tabbedLoginHeaderBoxDecoration,
          child: Center(
            child: Column(
              children: <Widget>[
                //* TAB BAR
                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  width: screenWidth,
                  color: myAppTheme['PrimaryBackgroundColor'],
                  child: TabBar(
                    controller: _nestedTabController,
                    indicatorColor: myAppTheme['AccentColor'],
                    labelColor: myAppTheme['AccentTextColor'],
                    unselectedLabelColor: myAppTheme['SecondaryTextColor'],
                    isScrollable: true,
                    tabs: <Widget>[
                      Tab(
                        text: "Login",
                      ),
                      Tab(
                        text: "Recuperar Password",
                      ),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  //* TAB VIEW
                  // THIS CONTAINER IS WHERE THE TAB DISPLAYS ITS PAGES
                  color: myAppTheme['PrimaryBackgroundColor'],
                  height: screenHeight * 0.5,
                  child: TabBarView(
                    controller: _nestedTabController,
                    children: <Widget>[
                      Container(
                        //* FIRST TAB PAGE
                        // LOGIN
                        child: LoginTab(),
                      ),
                      Container(
                        //* third TAB PAGE
                        // SIGNUP
                        child: RecuperarPasswordTab(),
                      ),
                    ],
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
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
    bool login = false;
    final String urlAutenticar = "http://localhost:8080/login";

    Future<bool> obtenerToken(String username, String password) async {
      //var resupuesta = await http.post(urlAutenticar,
      //  body: {"username": username, "password": password});
      //print(resupuesta.body);
      var dio = Dio();
      Response response = await dio.post(urlAutenticar,
          data: {"username": username, "password": password});
      print(response.data);
      if (response.data != null) {
        login = true;
        // storedUserCredentials.token = response.data.toString();
        // print(storedUserCredentials.token);
        saveUserCredentials();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPageLayoutBuilder(),
          ),
        );
      }
    }

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
                  hintText: 'e-Mail',
                  contentPadding: const EdgeInsets.all(15),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor ingrese su e-Mail';
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
                            return 'Ingrese password';
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
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //* LOGIN WITH GOOGLE BUTTON
            FlatButton(
              color: Colors.black,
              onPressed: () {},
              child: Text(
                "Login With Google",
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

class RecuperarPasswordTab extends StatelessWidget {
  //const LoginTab({Key key}) : super(key: key);
  static final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
/*
    Future<bool> recuperarPassword(String mail) async {
      String recuperarPass = "http://localhost:8080/usuarios/recuperarContra/";

      //var resupuesta = await http.post(urlAutenticar,
      //  body: {"username": username, "password": password});
      //print(resupuesta.body);
      recuperarPass += mail;
      print("link recuperarpass" + recuperarPass);
      var dio = Dio();
      Response response = await dio.post(recuperarPass);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TabbedLoginPage(),
        ),
      );
    }
*/
    return Container(
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Recuperar Password",
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
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'E-Mail',
                    contentPadding: const EdgeInsets.all(15),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'ingresa tu E-mail';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: tabbedLoginPagging,
                child: Row(
                  children: <Widget>[
                    //* SIGN UP BUTTON
                    FlatButton(
                      child: Text(
                        'Recuperar Password',
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
                        //TODO do separate function with checks
                        if (_signupFormKey.currentState.validate()) {
                          //   recuperarPassword(usernameController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //* SIGNUP WITH GOOGLE BUTTON

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
