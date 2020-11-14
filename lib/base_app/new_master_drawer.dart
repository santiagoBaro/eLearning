import 'package:elearning/base_app/user_credentials_data_type.dart';
import 'package:elearning/data_types/course_dataType.dart';
import 'package:elearning/pages/bedelias_page.dart';
import 'package:elearning/pages/course_page.dart';
import 'package:elearning/pages/landing_page.dart';
import 'package:elearning/pages/message_page.dart';
import 'package:elearning/tools/visual_assets.dart';
import 'package:flutter/material.dart';

import 'api_client.dart';

class MasterDrawer extends StatelessWidget {
  final Function(Widget) onElementSelected;
  MasterDrawer({
    Key key,
    @required this.onElementSelected,
  }) : super(key: key);
  var client = ApiClient();
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

          InkWell(
            onTap: () => onElementSelected(
              CoursePage(curso: courseRelleno),
            ),
            child: MasterTitle(
              text: "Cursos",
              icon: Icons.school,
            ),
          ),
          Container(
            height: 200,
            child: FutureBuilder<List<Course>>(
              future: client.getCourseList(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return MasterSubtitle(text: "no hay cursos disponibles");
                  }
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {},
                            child: MasterSubtitle(
                                text: snapshot.data[index].nombre));
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),

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
            onTap: () => onElementSelected(CoursePage(curso: courseRelleno)),
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
                          storedUserCredentials.userData.nombre,
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
                            storedUserCredentials.userData.carrera,
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
            color: Color(0xFFFB6107),
            onPressed: () => onElementSelected(LandingPage(
                onElementSelected: (Widget val) => onElementSelected(val))),
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
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
                    content: Container(
                      height: 150,
                      child: Column(
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
    return Container(
      height: 40,
      child: Row(
        children: [
          SizedBox(
            width: 60,
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
