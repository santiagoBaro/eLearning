import 'package:flutter/material.dart';

class ImageBookElement extends StatelessWidget {
  final String imageUrl;
  const ImageBookElement(
      {Key key,
      this.imageUrl =
          'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/132595909/original/617cedfdc6b6629143b0047669fb65f0336c59cd/make-any-graph-or-chart-or-analytic-design-in-high-quality.png'})
      : super(key: key);

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
