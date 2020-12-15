import 'package:flutter/material.dart';

const String defaultText =
    'Sed illum est beatae sunt iure non in enim. Ab enim odit dolorem voluptas. Veniam voluptates eos fugiat omnis quis explicabo. Soluta corporis omnis minima aperiam rem ea. Alias omnis aut est tempora dolores. Voluptate dicta ipsa animi laudantium voluptatibus ut harum Cumque nemo quia non in nobis. Id aliquam reprehenderit minima fugit dolorem omnis vitae nihil voluptatibus. Neque pariatur optio qui natus id atque quia consequatur. Accusantium eum harum aperiam veritatis aut. Aut consequuntur quos veritatis. Blanditiis in consequatur officia sunt consequuntur. Rerum qui ipsa et debitis totam excepturi facere. Facere dolorem veniam corporis. Debitis culpa quis deleniti at voluptates harum eum. Voluptates ducimus accusamus quo rerum.';

class ParagraphBookElement extends StatelessWidget {
  final String text;
  const ParagraphBookElement({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: _paragraphTextStyle,
      ),
    );
  }
}

TextStyle _paragraphTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.grey[700],
);
