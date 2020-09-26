import 'package:flutter/material.dart';

List<String> defaultList = [
  'Rempel, Huels and Nitzsche',
  'Abshire - Cartwright',
  'Upton, Bruen and Kassulke'
      'Kreiger, Lind and Lind'
];

class ListBookElement extends StatelessWidget {
  final String title;
  final List<String> elements;
  const ListBookElement({
    Key key,
    this.title,
    this.elements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* TITLE
        Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(
            title,
            style: titleTextStyle,
          ),
        ),
        //* LIST

        ListView.builder(
          itemCount: elements.length,
          itemBuilder: (context, i) {
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Icon(
                    Icons.brightness_1,
                    size: 15,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(elements[i]),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

TextStyle titleTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.grey,
);
