import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:elearning/base_app/mobile_landing_page.dart';
import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:flutter/material.dart';
import 'app_builder.dart';
import 'tools/visual_assets.dart';

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
                        text: "SignUp",
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
                        //* SECOND TAB PAGE
                        // SIGNUP
                        child: SignUpTab(),
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
                        storedUserCredentials
                            .setPassword(passwordContrller.text);
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

class SignUpTab extends StatelessWidget {
  //const SignUpTab({Key key}) : super(key: key);

  static final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordContrller = TextEditingController();
    final passwordCheckContrller = TextEditingController();
    final phoneController = TextEditingController();

    return Container(
      child: Form(
        key: _signupFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "SignUp",
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
                    //* PREFIX DROPDOWN
                    Container(
                      height: 50,
                      width: 120,
                      child: CountryPickerDropdown(
                        underline: Container(
                          height: 2,
                          color: Colors.red,
                        ),
                        onTap: () =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        onValuePicked: (Country country) {
                          print("${country.name}");
                        },
                        itemBuilder: (Country country) {
                          return Row(
                            children: <Widget>[
                              SizedBox(width: 8.0),
                              CountryPickerUtils.getDefaultFlagImage(country),
                              SizedBox(width: 8.0),
                              Expanded(child: Text(country.name)),
                            ],
                          );
                        },
                        itemHeight: null,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_downward),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      //* PHONE TEXT FIELD
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          controller: phoneController,
                          obscureText: true,
                          style: tabbedLoginInputTextStyle,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Phone',
                            contentPadding: const EdgeInsets.all(15),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Type your password again';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                //* FIRST PASSWORD TEXT FIELD
                padding: tabbedLoginPagging,
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
                      //TODO : improve password ckeck logic
                      return 'Please enter a valid password';
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
                      //* SECOND PASSWORD TEXT FIELD
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          controller: passwordCheckContrller,
                          obscureText: true,
                          style: tabbedLoginInputTextStyle,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Retype Password',
                            contentPadding: const EdgeInsets.all(15),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Type your password again';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    //* SIGN UP BUTTON
                    FlatButton(
                      child: Text(
                        'SignUp',
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
                height: 20,
              ),

              //* SIGNUP WITH GOOGLE BUTTON
              FlatButton(
                color: Colors.black,
                onPressed: () {},
                child: Text(
                  "SingUp With Google",
                  style: hilightTextStyle,
                ),
              ),
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
