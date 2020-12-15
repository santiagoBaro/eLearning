import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

const List<String> defaultList = [
  'Rempel, Huels and Nitzsche',
  'Abshire - Cartwright',
  'Upton, Bruen and Kassulke',
  'Kreiger, Lind and Lind',
];

class MultiplechoiceBookElement extends StatefulWidget {
  final String question;
  final List<String> options;
  final int answer;
  MultiplechoiceBookElement({
    Key key,
    @required this.question,
    @required this.options,
    @required this.answer,
  }) : super(key: key);

  @override
  _MultiplechoiceBookElementState createState() =>
      _MultiplechoiceBookElementState();
}

class _MultiplechoiceBookElementState extends State<MultiplechoiceBookElement> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return Column(
      children: [
        //* TITLE
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            widget.question,
            style: _textStyle,
          ),
        ),

        //* OPTIOPNS LIST
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          controller: controller,
          itemCount: widget.options.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    child: FlatButton(
                      minWidth: 60,
                      child: Text('${index.toString()}'),
                      onPressed: () {
                        //TODO enviar respuesta
                        if (index + 1 == widget.answer) {
                          showToast('CORRECTO !!',
                              context: context,
                              animation: StyledToastAnimation.slideFromBottom,
                              reverseAnimation:
                                  StyledToastAnimation.slideToBottom,
                              startOffset: Offset(0.0, 3.0),
                              reverseEndOffset: Offset(0.0, 3.0),
                              position: StyledToastPosition.bottom,
                              duration: Duration(seconds: 4),
                              //Animation duration   animDuration * 2 <= duration
                              animDuration: Duration(seconds: 1),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.fastOutSlowIn);
                        } else {
                          showToast('Su respuesta no es correcta',
                              context: context,
                              animation: StyledToastAnimation.slideFromBottom,
                              reverseAnimation:
                                  StyledToastAnimation.slideToBottom,
                              startOffset: Offset(0.0, 3.0),
                              reverseEndOffset: Offset(0.0, 3.0),
                              position: StyledToastPosition.bottom,
                              duration: Duration(seconds: 4),
                              //Animation duration   animDuration * 2 <= duration
                              animDuration: Duration(seconds: 1),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.fastOutSlowIn);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    child: Container(
                      child: Text(
                        widget.options[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

TextStyle _textStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey[600],
);
