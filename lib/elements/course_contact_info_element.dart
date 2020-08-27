import 'package:flutter/material.dart';

import 'course_information_card.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* NAME
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white24,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'profesor:',
                  style: informationTextStyle,
                ),
                SizedBox(width: 30),
                Text(
                  'Nombre Profesor',
                  style: informationTextStyle,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5),

        //* EMAIL
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white24,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Email',
                  style: informationTextStyle,
                ),
                SizedBox(width: 30),
                Text(
                  'nombreProfesor@mail.com',
                  style: informationTextStyle,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5),

        //* INTERNAL PHONE
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white24,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Interno',
                  style: informationTextStyle,
                ),
                SizedBox(width: 30),
                Text(
                  '25001122 +012',
                  style: informationTextStyle,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
