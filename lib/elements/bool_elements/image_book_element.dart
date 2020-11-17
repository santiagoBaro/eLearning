import 'package:flutter/material.dart';

class ImageBookElement extends StatelessWidget {
  final String imageUrl;
  const ImageBookElement({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 300),
      child: Image.network(
        imageUrl,
      ),
    );
  }
}
