import 'package:elearning/elements/course_carrousell.dart';
import 'package:elearning/elements/user_forum_listing.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Function(Widget) onElementSelected;
  const LandingPage({
    Key key,
    this.onElementSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CourseCarrousel(
            onElementSelected: (Widget val) => onElementSelected(val),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 45),
            height: 1,
            color: Colors.black12,
          ),
          UserFormListing(),
        ],
      ),
    );
  }
}
