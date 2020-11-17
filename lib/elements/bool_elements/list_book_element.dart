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
  ScrollController controller = ScrollController();
  ListBookElement({
    Key key,
    @required this.title,
    @required this.elements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* TITLE
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            title,
            style: titleTextStyle,
          ),
        ),
        //* LIST

        Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: elements.length,
            controller: controller,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                height: 50,
                child: Row(
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
                      child: Text(
                        elements[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
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
