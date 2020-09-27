import 'package:flutter/material.dart';

const List<String> defaultList = [
  'Rempel, Huels and Nitzsche',
  'Abshire - Cartwright',
  'Upton, Bruen and Kassulke',
  'Kreiger, Lind and Lind'
];

class ListBookElement extends StatelessWidget {
  final String title;
  final List<String> elements;
  const ListBookElement({
    Key key,
    this.title = 'consequatur corrupti voluptas',
    this.elements = defaultList,
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

        Expanded(
          child: Container(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: elements.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Row(
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
                      child: Text(elements[index]),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

TextStyle titleTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.grey,
);
