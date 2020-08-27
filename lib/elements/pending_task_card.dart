import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

class PendingTaskCard extends StatelessWidget {
  const PendingTaskCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 600),
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          //* COLOR DECORATION
          Container(
            width: 4,
            height: 80,
            color: Colors.amber,
          ),
          //* DATE
          Container(
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '4/9',
                  style: mainTextStyle,
                ),
                Text(
                  'Fri',
                  style: secondaryTextStyle,
                ),
              ],
            ),
          ),
          //* SEPARATOR
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            width: 1,
            height: 60,
            color: Colors.grey[300],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* TASK NAME
              Text(
                'Cuestionario',
                style: mainTextStyle,
              ),
              //* COURSE NAME
              Text(
                'proyecto',
                style: secondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TextStyle mainTextStyle = TextStyle(
  fontSize: 18,
  color: myAppTheme['SecondaryTextColor'],
  fontWeight: FontWeight.bold,
);

TextStyle secondaryTextStyle = TextStyle(
  color: myAppTheme['PrimaryTextColor'],
);
