import 'package:flutter/material.dart';

class ImageBookElement extends StatelessWidget {
  final String imageUrl;
  const ImageBookElement({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
    );
  }
}
