import 'package:flutter/material.dart';

ScrollController _scrollController = ScrollController();
_scrollToBottom() {
  _scrollController.animateTo(_scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 5), curve: Curves.linear);
}

class CourseCard extends StatelessWidget {
  final String name;
  final Color color;
  const CourseCard({
    Key key,
    this.name = 'Curso',
    this.color = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 170,
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
            Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //* CARD HEADER COLOR
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                  ),
                  //* COURSE NAME
                  Expanded(
                    child: Container(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          reverse: true,
                          child: Text(
                            name,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //* COLOR BAGDE
            Positioned(
              right: 20,
              top: 10,
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
      ),
    );
  }
}
