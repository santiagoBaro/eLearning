import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

class CourseContentCard extends StatelessWidget {
  final String name;
  final Color bkgColor;
  final IconData icon;
  final String currentIndex;
  final String targetIndex;
  const CourseContentCard({
    Key key,
    this.name = 'Course Card',
    this.icon = Icons.error_outline,
    this.currentIndex = '120',
    this.targetIndex = '145',
    this.bkgColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    if (icon == Icons.check_circle_outline) {
      color = myAppTheme['SuccessColor'];
    } else if (icon == Icons.error_outline) {
      color = myAppTheme['CautionColor'];
    } else {
      color = myAppTheme['WarningColor'];
    }
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 13,
      ),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          //* BACKGROUND COLOR
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: bkgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //* TITLE
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(name,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: nameTextStyle),
                    ),
                    SizedBox(height: 10),
                    //* INDEXES
                    Row(
                      children: [
                        Text(
                          currentIndex,
                          style: indexTextStyle,
                        ),
                        SizedBox(width: 30),
                        Text(
                          targetIndex,
                          style: indexTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

          //* ICON
          Positioned(
            right: 20,
            top: 30,
            child: Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.brightness_1,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      top: 5,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        icon,
                        color: color,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle indexTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 14,
);

TextStyle nameTextStyle = TextStyle(
  color: Colors.grey[700],
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
