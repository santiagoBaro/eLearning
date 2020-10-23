import 'package:flutter/material.dart';

class EnrollmentGridElement extends StatelessWidget {
  final String title;
  const EnrollmentGridElement({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 5,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(30, (index) {
            return Container(
              height: 20,
              width: 50,
              color: Colors.white,
              child: Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
