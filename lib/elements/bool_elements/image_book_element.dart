import 'package:elearning/firebase/load_image.dart';
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
    return FutureBuilder(
      future: getFireImage(context, image),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Container(
            constraints: BoxConstraints(maxHeight: 300),
            child: snapshot.data,
          );

        if (snapshot.connectionState == ConnectionState.waiting)
          return Container(
            height: 300,
            width: 300,
            child: CircularProgressIndicator(),
          );

        return Container();
      },
    );
  }
}
