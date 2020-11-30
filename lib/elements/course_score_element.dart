import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Transform(
        child: new Row(
          children: [
            Transform(
              child: Column(
                children: [
                  Text(
                    '8.3',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'prom: 7.2     ',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
              alignment: FractionalOffset.center,
              transform: new Matrix4.identity()..rotateZ(-15 * 3.1415927 / 180),
            ),
            Text(
              '/',
              style: TextStyle(
                fontSize: 70,
                color: Colors.white,
              ),
            ),
            Transform(
              child: Text(
                '12',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              alignment: FractionalOffset.center,
              transform: new Matrix4.identity()..rotateZ(-15 * 3.1415927 / 180),
            ),
          ],
        ),
        alignment: FractionalOffset.center,
        transform: new Matrix4.identity()..rotateZ(15 * 3.1415927 / 180),
      ),
    );
  }
}
