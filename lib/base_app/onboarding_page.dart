import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';
import 'package:flutter/material.dart';
import 'package:elearning/base_app/tabbed_login_page.dart';
import 'tools/visual_assets.dart';

import 'base_app_values.dart';
import 'onboarding_page_element.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    //
    storedUserCredentials = logedOffUser;
    saveUserCredentials();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: myAppTheme['PrimaryBackgroundColor'],
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    //* ONBOARDING ILUSTRATIONS CARROUSELL
                    GooeyCarousel(
                      children: <Widget>[
                        //* FIRST PAGE
                        Stack(
                          children: <Widget>[
                            Container(color: Colors.grey[100]),
                            Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: Image.asset(
                                    'assets/images/mente.png',
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 320.0,
                                  bottom: 20,
                                  right: 20,
                                ),
                                child: Text(
                                  "La Mejor Manera De Aprender",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 500.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ActiveIndicator(),
                                    InactiveIndicator(),
                                    InactiveIndicator(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        //* SECOND PAGE
                        Stack(
                          children: <Widget>[
                            Container(color: Colors.grey[200]),
                            Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: Image.asset(
                                    'assets/images/transporte.png',
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 360.0),
                                child: Text(
                                  "No Importa El Lugar",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 500.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InactiveIndicator(),
                                    ActiveIndicator(),
                                    InactiveIndicator(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        //* THIRD PAGE
                        Stack(
                          children: <Widget>[
                            Container(color: Colors.grey[100]),
                            Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 100.0),
                                  child: Image.asset(
                                    'assets/images/huevo.png',
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 300.0),
                                child: Text(
                                  "Sigue El Progreso",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.height * 0.1,
                              left:
                                  MediaQuery.of(context).size.width * 0.5 - 60,
                              width: 120,
                              child: RaisedButton(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: myAppTheme['HighlightTextColor'],
                                    fontSize: 20,
                                    shadows: [
                                      textShadow,
                                      textHilight,
                                    ],
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(15),
                                color: Colors.blueGrey,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TabbedLoginPage(
                                        initialIndex: 1,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 500.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InactiveIndicator(),
                                    InactiveIndicator(),
                                    ActiveIndicator(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //* LOGIN REDITECTION
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: onboardingMessageTextStyle,
                    ),
                    FlatButton(
                      child: Text(
                        'Login',
                        style: onboardingMessageTextStyle,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TabbedLoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//* this method returns a list of OnboardingSlides using BaseApp info
  List<Widget> _getOnboardingSlides() {
    List<Widget> returnList = List<Widget>();
    int leangth = myAppValues.onboarding.length;

    for (var i = 0; i < leangth; i++) {
      returnList.add(
        OnboardingPageSlide(
          currentIndex: i,
          imgUrl: myAppValues.onboarding[i].imgUrl,
          maxIndex: leangth,
          message: myAppValues.onboarding[i].message,
        ),
      );
    }
  }
}

class ActiveIndicator extends StatelessWidget {
  const ActiveIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.trip_origin,
            color: myAppTheme['ShadowColor'],
            size: 30,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Icon(
              Icons.brightness_1,
              color: myAppTheme['AccentColor'],
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class InactiveIndicator extends StatelessWidget {
  const InactiveIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.trip_origin,
        color: myAppTheme['ShadowColor'],
        size: 30,
      ),
    );
  }
}
