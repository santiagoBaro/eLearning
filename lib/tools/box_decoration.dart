import 'package:flutter/material.dart';
import 'visual_assets.dart';

EdgeInsets tabbedLoginPagging = EdgeInsets.only(left: 30.0, right: 75.0);

BoxDecoration primaryMessageBubbleBoxDecorator = BoxDecoration(
  color: myAppTheme['AccentColor'],
  borderRadius: new BorderRadius.only(
    topRight: const Radius.circular(10.0),
    bottomLeft: const Radius.circular(10.0),
    bottomRight: const Radius.circular(10.0),
  ),
);

BoxDecoration secondaryMessageBubbleBoxDecorator = BoxDecoration(
  color: myAppTheme['CardBackgroundColor'],
  borderRadius: new BorderRadius.only(
    topLeft: const Radius.circular(10.0),
    bottomLeft: const Radius.circular(10.0),
    bottomRight: const Radius.circular(10.0),
  ),
);

BoxDecoration popUpBoxDecorator = BoxDecoration(
  color: myAppTheme['PopUpBackgroundColor'],
  borderRadius: new BorderRadius.all(
    const Radius.circular(5.0),
  ),
);

BoxDecoration tabbedLoginHeaderBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: eLearningMainGradient,
    stops: stops2colors,
    begin: Alignment.topLeft,
    end: Alignment.center,
  ),
);

BoxDecoration shadowAppBarBoxDecorator = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10.0, // has the effect of softening the shadow
      spreadRadius: 5.0, // has the effect of extending the shadow
      offset: Offset(
        0.0, // horizontal, dont move
        -10.0, // vertical, move up 10
      ),
    )
  ],
  gradient: LinearGradient(
    colors: [Colors.black54, Colors.black26],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ),
);
