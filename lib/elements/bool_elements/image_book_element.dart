import 'package:flutter/material.dart';

class ImageBookElement extends StatelessWidget {
  final String imageUrl;
  const ImageBookElement({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image =
        "https://firebasestorage.googleapis.com/v0/b/push-notifications-ee58a.appspot.com/o/Screenshot%20from%202020-11-18%2020-14-13.png?alt=media&token=3326faad-4bba-4b62-8ed2-90f54eada793";

    return Container(
      constraints: BoxConstraints(maxHeight: 300),
      child: Image.network(
        image,
      ),
    );
  }
}
