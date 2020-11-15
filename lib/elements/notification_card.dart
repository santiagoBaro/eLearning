import 'package:elearning/data_types/foro_dataType.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  final Forum foro;
  NotificationCard({Key key, @required this.foro}) : super(key: key);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      constraints: BoxConstraints(
        minWidth: 300,
        maxWidth: 800,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          //* LOG-OUT  BUTTON PRESSED POP-UP
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    children: [
                      Text(widget.foro.name ?? ""),
                      Row(
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text('Cancelar'),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text('Si'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        },
        child: Column(
          children: [
            NotificationCardHeader(foro: widget.foro),
            NitificationCardBody(),
          ],
        ),
      ),
    );
  }
}

class NotificationCardHeader extends StatelessWidget {
  final Forum foro;
  const NotificationCardHeader({Key key, this.foro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          SizedBox(width: 10),
          //* IMAGE
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* FORUM TITLE
                Text(
                  foro.name ?? "nombre vacio",
                  style: courseNameTextStyle,
                ),
                //* FORUM TYPE
                Text(
                  foro.type ?? "tipo vacio",
                  style: userNameTextStyle,
                ),
              ],
            ),
          ),
          //* DATE
          Text(
            _buildDate(foro.date),
            style: courseNameTextStyle,
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class NitificationCardBody extends StatelessWidget {
  const NitificationCardBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Dolor sunt aliquid maxime voluptatem saepe vel quia culpa adipisci. Et cupiditate hic deleniti dignissimos vel ipsam. Vel repellat maiores ut accusamus iusto. Natus odit accusantium vitae vel blanditiis fuga.',
          style: bodyTextStyle,
        ),
      ),
    );
  }
}

TextStyle courseNameTextStyle = TextStyle(
  fontSize: 18,
  color: myAppTheme['SecondaryTextColor'],
  fontWeight: FontWeight.bold,
);

TextStyle userNameTextStyle = TextStyle(
  color: myAppTheme['PrimaryTextColor'],
);

TextStyle bodyTextStyle = TextStyle(
  color: myAppTheme['SecondaryTextColor'],
);

String _buildDate(String date) {
  String base = date.split("T")[0];
  var elem = base.split("-");
  return "${elem[1]}/${elem[2]}";
}
