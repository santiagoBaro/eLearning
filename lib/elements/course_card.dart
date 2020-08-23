import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String name;
  final String img;
  final Color color;
  const CourseCard({
    Key key,
    this.name = 'Course Card',
    this.img =
        'https://images.vexels.com/media/users/3/199132/raw/e263cc1af6ada7fd5204f90ba91274c2-calculus-school-cover-design.jpg',
    this.color = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 13,
      ),
      height: 150,
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
          //* IMAGE
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 175,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      name,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          //* COLOR BAGDE
          Positioned(
            right: 20,
            bottom: 30,
            child: Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.trip_origin,
                      color: Colors.grey[200],
                      size: 40,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        top: 5,
                      ),
                      child: Icon(
                        Icons.brightness_1,
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
