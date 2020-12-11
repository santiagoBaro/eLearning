import 'package:pushnotifications/tools/visual_assets.dart';
import 'package:flutter/material.dart';

ScrollController _scrollController = ScrollController();
_scrollToBottom() {
  _scrollController.animateTo(_scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 5), curve: Curves.linear);
}

class CourseContentCard extends StatelessWidget {
  final String name;
  final Color bkgColor;
  final IconData icon;
  final String currentIndex;
  final String targetIndex;
  const CourseContentCard({
    Key key,
    this.name = 'Curso',
    this.icon = Icons.error_outline,
    this.currentIndex = '120',
    this.targetIndex = '145',
    this.bkgColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
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

                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollController,
                        reverse: true,
                        child: Text(name,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: nameTextStyle),
                      ),
                    ),
                  ],
                ),
              )
            ],
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
