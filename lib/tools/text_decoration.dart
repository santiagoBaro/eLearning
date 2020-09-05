import 'package:flutter/material.dart';
import 'visual_assets.dart';

Shadow textShadow = Shadow(
  blurRadius: 10.0,
  color: Colors.black38,
  offset: Offset(3.0, 3.0),
);

Shadow textHilight = Shadow(
  blurRadius: 10.0,
  color: Colors.white38,
  offset: Offset(-2.0, -2.0),
);

Shadow smallTextShadow = Shadow(
  blurRadius: 3.0,
  color: Colors.black12,
  offset: Offset(1.5, 1.5),
);

Shadow smallTextHilight = Shadow(
  blurRadius: 3.0,
  color: Colors.white38,
  offset: Offset(-1.0, -1.0),
);

TextStyle hintTextStyle = TextStyle(
  color: myAppTheme['HintTextColor'],
);

TextStyle primaryMessageTextStyle = TextStyle(
  color: myAppTheme['HighlightTextColor'],
  fontWeight: FontWeight.bold,
  shadows: [
    textShadow,
    textHilight,
  ],
);

TextStyle onboardingTextStyle = TextStyle(
  fontFamily: 'NatureBeauty',
  height: 2.5,
  fontSize: 40,
  shadows: [
    textShadow,
    textHilight,
  ],
  color: myAppTheme['PrimaryTextColor'],
);

TextStyle mapMarkerTextStyle = TextStyle(
  fontSize: 9,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  shadows: [
    smallTextShadow,
    //smallTextHilight,
  ],
);

TextStyle secondaryMessageTextStyle = TextStyle(
  color: myAppTheme['SecondaryTextColor'],
  fontWeight: FontWeight.bold,
  shadows: [
    textShadow,
    textHilight,
  ],
);

TextStyle accentTextStyle = TextStyle(
  fontSize: 10,
  color: myAppTheme['SecondaryTextColor'],
);

TextStyle titleTextStyle = TextStyle(
  fontSize: 30,
  height: 2,
  color: myAppTheme['PrimaryTextColor'],
  shadows: [
    textShadow,
    textHilight,
  ],
);

TextStyle chipTextStyle = TextStyle(
  fontSize: 10,
  color: myAppTheme['SecondaryTextColor'],
);

TextStyle profileStatTextStyle = TextStyle(
  fontSize: 20,
  color: myAppTheme['HighlightTextColor'],
  shadows: [
    textShadow,
  ],
);

TextStyle hilightTextStyle = TextStyle(
  fontSize: 20,
  color: myAppTheme['HighlightTextColor'],
  shadows: [
    textShadow,
    textHilight,
  ],
);

TextStyle postTitleTextStyle = TextStyle(
  color: myAppTheme['HighlightTextColor'],
  fontSize: 20,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black38,
      offset: Offset(3.0, 3.0),
    ),
  ],
);

TextStyle tabbedLoginInputTextStyle = TextStyle(
  fontSize: 18,
  height: 1.2,
  color: myAppTheme['SecondaryTextColor'],
  shadows: [
    textShadow,
    textHilight,
  ],
);
