import 'package:elearning/pages/bedelias_page.dart';
import 'package:elearning/pages/course_page.dart';
import 'package:elearning/pages/landing_page.dart';
import 'package:elearning/pages/messages_list_page.dart';
import 'package:flutter/material.dart';

import 'package:elearning/tools/visual_assets.dart';

class Master extends StatelessWidget {
  final Function(Widget) onElementSelected;
  const Master({
    Key key,
    @required this.onElementSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* HEADER
          MasterHeader(
            onElementSelected: (Widget val) => onElementSelected(val),
          ),
          //* LIST OF ELEMENTS
          //* GROUP
          SizedBox(
            height: 10,
          ),
          GroupTile(
            onElementSelected: (Widget val) => onElementSelected(CoursePage()),
            name: 'Mis Cursos',
            icon: Icons.school,
            children: [
              'Proyecto',
              '.NET',
              'BD No-SQL',
              'TCT',
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GroupTile(
            onElementSelected: (Widget val) =>
                onElementSelected(MessagesListPage()),
            name: 'Mensajes',
            icon: Icons.mail_outline,
            children: [
              'profesor',
              'grupo',
              'companero',
              'companero',
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GroupTile(
            onElementSelected: (Widget val) =>
                onElementSelected(BedeliasPage()),
            name: 'Inscripciones',
            icon: Icons.assignment,
            children: [
              'curso',
              'examen',
              'evento',
              'competencia',
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GroupTile(
            onElementSelected: (Widget val) => onElementSelected(val),
            name: 'Organizacion',
            icon: Icons.domain,
            children: [
              'bedelias',
              'Inco',
              'decano',
              'consejo estudiantil',
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GroupTile(
            onElementSelected: (Widget val) => onElementSelected(val),
            name: 'Consultas',
            icon: Icons.help_outline,
            children: [
              'plan de estudio',
              'previaturas',
              'calendario lectivo',
              'escolaridad'
            ],
          ),

          SizedBox(
            height: 30,
          ),
          //* FOOTER
          MsterFooter(),
        ],
      ),
    );
  }
}

class GroupTile extends StatelessWidget {
  final Widget redirect;
  final String name;
  final IconData icon;
  final List<String> children;
  final Function(Widget) onElementSelected;
  const GroupTile({
    Key key,
    this.name = 'Group Name',
    this.redirect,
    this.icon,
    this.children,
    this.onElementSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          //* GROUP NAME
          onTap: () => onElementSelected(Container()),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                ),
                Icon(
                  icon,
                  color: Colors.grey[600],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          color: Colors.black12,
        ),
        //* LIST EL ELEMENTS
        ElementTile(
          onElementSelected: (Widget val) => onElementSelected(val),
          text: children[0],
        ),
        ElementTile(
          onElementSelected: (Widget val) => onElementSelected(val),
          text: children[1],
        ),
        ElementTile(
          onElementSelected: (Widget val) => onElementSelected(val),
          text: children[2],
        ),
        ElementTile(
          onElementSelected: (Widget val) => onElementSelected(val),
          text: children[3],
        ),
      ],
    );
  }
}

class ElementTile extends StatelessWidget {
  final String text;
  final Function(Widget) onElementSelected;
  const ElementTile({
    Key key,
    this.text = 'element  name',
    this.onElementSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onElementSelected(Container()),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 40,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class MasterHeader extends StatelessWidget {
  final Function(Widget) onElementSelected;
  const MasterHeader({Key key, this.onElementSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //* BACKGROUND IMAGE
        Image.asset(
          'assets/images/background_mountains.jpg',
          width: 305,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Container(
              width: 280,
              child: Row(
                children: [
                  //* USER'S IMAGE
                  CircleAvatar(
                    radius: 50,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 175,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //* USER'S NAME
                        Text(
                          'Nombre Apellido',
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        //* USER'S TAG
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'carrera',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //* HOME BUTTON
        Positioned(
          bottom: 8,
          left: 100,
          child: FlatButton(
            color: Colors.blueGrey,
            onPressed: () => onElementSelected(LandingPage()),
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MsterFooter extends StatelessWidget {
  const MsterFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        FlatButton(
          color: myAppTheme['InfoColor'],
          onPressed: () {},
          child: Text(
            //* HELP BUTTONF
            'Ayuda',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        FlatButton(
          //* LOG-OUT BUTTON
          color: Colors.black12,
          onPressed: () {
            //* LOG-OUT  BUTTON PRESSED POP-UP
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(
                      children: [
                        Text('Seguro que quieres cerrar sesion?'),
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
          child: Text(
            'Cerrar Sesion',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class CenterdText extends StatelessWidget {
  final String text;
  const CenterdText({Key key, this.text = 'Centerd Text'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
