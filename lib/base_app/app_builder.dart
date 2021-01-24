import 'dart:convert';
import 'package:pushnotifications/pages/onboarding/onboarding_page.dart';
import 'package:pushnotifications/base_app/user_credentials_data_type.dart';
import 'package:pushnotifications/base_app/desktop_landing_page.dart';
import 'package:pushnotifications/base_app/mobile_landing_page.dart';
import 'package:flutter/material.dart';
import 'package:pushnotifications/pages/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_client.dart';
import 'package:flutter/services.dart';

import 'tablet_landing_page.dart';

class BaseApp extends StatefulWidget {
  BaseApp({Key key}) : super(key: key);

  @override
  _BaseAppState createState() => _BaseAppState();
}

//Widget baseWidget = LandingPage();

class _BaseAppState extends State<BaseApp> {
  TextEditingController nameController = TextEditingController();

  //@override
  //void initState() {
  //  super.initState();
  //}

  Future<Null> autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedPreferencesString = prefs.getString("Sappio");
    if (savedPreferencesString == null || savedPreferencesString == '') {
      storedUserCredentials = emptyUser;
    } else {
      Map savedPreferences = jsonDecode(savedPreferencesString);
      storedUserCredentials = UserCredentials.fromJson(savedPreferences);
      if (storedUserCredentials.getUserData() == null) {
        storedUserCredentials = emptyUser;
      } else if (storedUserCredentials.getUserData().mail == '') {
        storedUserCredentials = emptyUser;
      } else {
        ApiClient.setAuthHeader();
        String title;
        if (storedUserCredentials.getUserData().tipoUsu == 'E') {
          title = "Sappio - Estudiante";
        } else {
          title = "Sappio - Docente";
        }
        SystemChrome.setApplicationSwitcherDescription(
            ApplicationSwitcherDescription(
          label: title,
          primaryColor: Theme.of(context).primaryColor.value,
        ));
      }
    }
    return Future<Null>.sync(() => null);
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Sappio", logedOffUser.toJson().toString());

    setState(() {
      storedUserCredentials = logedOffUser;
    });
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Sappio", nameController.text);

    setState(() {
      storedUserCredentials.setName('newNickname');
      storedUserCredentials.setToken('newToken');
      storedUserCredentials.isNewUser = false;
    });

    String title;
    if (storedUserCredentials.getUserData().tipoUsu == 'E') {
      title = "Sappio - Estudiante";
    } else {
      title = "Sappio - Docente";
    }
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: title,
      primaryColor: Theme.of(context).primaryColor.value,
    ));

    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: autoLogIn(),
      builder: (BuildContext context, AsyncSnapshot<Null> snapshot) {
        //return DrawerLandingPage();
        if (storedUserCredentials == null) {
          return Container(
            color: Colors.blueGrey,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (storedUserCredentials.getNickname() == "empty") {
            if (storedUserCredentials.isNewUser) {
              //* IF THE USER IS NEW
              return OnboardingPage();
            } else {
              //* IF IT IS NOT LOGGED IN, BUT NOT NEW
              return LoginPage();
            }
          } else {
            //* IF IT IS LOGGED IN
            return LandingPageLayoutBuilder();
          }
        }
      },
    );
  }
}

class LandingPageLayoutBuilder extends StatelessWidget {
  const LandingPageLayoutBuilder({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 1100.0) {
        //* IF THE SCREENS WIDTH IS LARGER THAN 1100
        return DesktopLandingPage();
      } else if (constraints.maxWidth >= 770.0) {
        //* IF THE SCREENS WIDTH IS LARGER THAN 770 AND SMALLER THAN 1000
        return TabletLandingPage();
      }
      //* IF THE SCREENS WIDTH IS SMALLER THAN 650
      return MoblieLandingPage();
    });
  }
}
