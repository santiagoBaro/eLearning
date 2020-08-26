import 'package:elearning/base_app/base_app_values.dart';
import 'package:elearning/pages/tabbed_login_page.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

class OnboardingPageSlide extends StatelessWidget {
  final String imgUrl;
  final String message;
  final int maxIndex;
  final int currentIndex;
  const OnboardingPageSlide({
    Key key,
    @required this.imgUrl,
    @required this.message,
    @required this.maxIndex,
    @required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(color: Colors.grey[100]),

        //* IMAGE
        Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Image.asset(
                imgUrl,
              ),
            ),
          ),
        ),

        //* MESSAGE
        Center(
          child: Container(
            margin: EdgeInsets.only(
              top: 320.0,
              bottom: 20,
              right: 20,
            ),
            child: Text(
              message,
              style: myAppValues.onboardingTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),

        //* SIGNUP BUTTON
        //* only visible on the last slide
        Visibility(
          visible: (maxIndex == currentIndex),
          child: Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.5 - 80,
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
              color: myAppTheme['AccentColor'],
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
        ),

        //* INDICATOR
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 500.0),
            child: Container(
              height: 50,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: maxIndex,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == currentIndex) {
                      return ActiveIndicator();
                    }
                    return InactiveIndicator();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
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
            color: Colors.white12,
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
        color: Colors.white12,
        size: 30,
      ),
    );
  }
}
