import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/data_types/Curso.dart';
import 'package:elearning/pages/bedelias_page.dart';
import 'package:elearning/pages/course_page.dart';
import 'package:elearning/pages/landing_page.dart';
import 'package:elearning/pages/message_page.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

class MasterDrawer extends StatelessWidget {
  final Function(Widget) onElementSelected;
  const MasterDrawer({
    Key key,
    @required this.onElementSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Curso> cursos = storedUserCredentials.getCursos();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* HEADER
          MasterHeader(
            onElementSelected: (Widget val) => onElementSelected(val),
          ),

          InkWell(
            onTap: () => onElementSelected(
              CoursePage(
                  onElementSelected: (Widget val) => onElementSelected(val)),
            ),
            child: MasterTitle(
              text: "Cursos",
              icon: Icons.school_outlined,
            ),
          ),

          MasterSubtitle(text: "BD no-sql"),
          MasterSubtitle(text: "tct"),

          InkWell(
            onTap: () => onElementSelected(MessagePage()),
            child: MasterTitle(
              text: "Mensajes",
              icon: Icons.message_outlined,
            ),
          ),
          MasterSubtitle(text: "profesor"),
          MasterSubtitle(text: "grupo"),
          MasterSubtitle(text: "companero"),
          MasterSubtitle(text: "companero"),

          InkWell(
            onTap: () => onElementSelected(BedeliasPage()),
            child: MasterTitle(
              text: "Inscripciones",
              icon: Icons.assignment,
            ),
          ),
          MasterSubtitle(text: "curso"),
          MasterSubtitle(text: "examen"),
          MasterSubtitle(text: "evento"),

          InkWell(
            onTap: () => onElementSelected(CoursePage()),
            child: MasterTitle(
              text: "Organizacion",
              icon: Icons.domain,
            ),
          ),
          MasterSubtitle(text: "bedelias"),
          MasterSubtitle(text: "inco"),
          MasterSubtitle(text: "decano"),
          MasterSubtitle(text: "concejo estudiantil"),

          MasterTitle(
            text: "Consultas",
            icon: Icons.help_outline,
          ),
          MasterSubtitle(text: "plan de estudio"),
          MasterSubtitle(text: "previaturas"),
          MasterSubtitle(text: "calendario lectivo"),
          MasterSubtitle(text: "escolaridad"),

          SizedBox(height: 30),
          //* FOOTER
          MsterFooter(),
          SizedBox(height: 15),
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
                          storedUserCredentials.getNickname(),
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
                            storedUserCredentials.getCarrera(),
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
            onPressed: () => onElementSelected(LandingPage(
                onElementSelected: (Widget val) => onElementSelected(val))),
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

class MasterTitle extends StatelessWidget {
  final String text;
  final IconData icon;
  const MasterTitle({Key key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
                text,
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
        Container(
          height: 1,
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          color: Colors.black12,
        ),
      ],
    );
  }
}

class MasterSubtitle extends StatelessWidget {
  final String text;
  const MasterSubtitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
