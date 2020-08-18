import 'package:flutter/material.dart';

import 'base_app_values.dart';
import 'tools/theme.dart';

class Master extends StatelessWidget {
  const Master({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* HEADER
          MasterHeader(),
          //* LIST OF ELEMENTS
          //* GROUP
          SizedBox(
            height: 10,
          ),
          GroupTile(
            name: 'Mensajes',
            icon: Icons.mail_outline,
          ),
          SizedBox(
            height: 10,
          ),
          GroupTile(
            name: 'Inscripciones',
            icon: Icons.assignment,
          ),
          SizedBox(
            height: 10,
          ),
          GroupTile(
            name: 'Organizacion',
            icon: Icons.domain,
          ),
          SizedBox(
            height: 10,
          ),
          GroupTile(
            name: 'Consultas',
            icon: Icons.help_outline,
          ),

          SizedBox(
            height: 30,
          ),
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
  const GroupTile({Key key, this.name = 'Group Name', this.redirect, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
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
                Icon(icon),
                SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 25,
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
        ElementTile(
          text: 'profesor',
        ),
        ElementTile(
          text: 'estudiante',
        ),
        ElementTile(
          text: 'profesor',
        ),
        ElementTile(
          text: 'estudiante',
        ),
      ],
    );
  }
}

class ElementTile extends StatelessWidget {
  final String text;
  const ElementTile({Key key, this.text = 'element  name'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 30,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class MasterHeader extends StatelessWidget {
  const MasterHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background_mountains.jpg',
          width: 310,
          height: 250,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          bottom: 60,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nombre Usuario',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'carrera',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 100,
          child: FlatButton(
            color: Colors.blueGrey,
            onPressed: () {},
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
            'Ayuda',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        FlatButton(
          color: Colors.black12,
          onPressed: () {},
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

final List<MasterGroup> eLearningMasterList = [
  MasterGroup(
    name: 'Mensajes',
    redirect: EmptyWidget(text: 'Mensajes'),
    elements: [
      MasterElement(
        name: 'profesor',
        redirect: EmptyWidget(text: 'Mensajes = profesor'),
      ),
      MasterElement(
        name: 'grupo',
        redirect: EmptyWidget(text: 'Mensajes = profesor'),
      ),
      MasterElement(
        name: 'companero',
        redirect: EmptyWidget(text: 'Mensajes = profesor'),
      ),
    ],
  ),
  MasterGroup(
    name: 'Inscripciones',
    redirect: EmptyWidget(text: 'Inscripciones'),
    elements: [
      MasterElement(
        name: 'curso',
        redirect: EmptyWidget(text: 'Inscripciones = curso'),
      ),
      MasterElement(
        name: 'examen',
        redirect: EmptyWidget(text: 'Inscripciones = examen'),
      ),
      MasterElement(
        name: 'evento',
        redirect: EmptyWidget(text: 'Inscripciones = evento'),
      ),
      MasterElement(
        name: 'compreticion',
        redirect: EmptyWidget(text: 'Inscripciones = compreticion'),
      ),
      MasterElement(
        name: 'carrera',
        redirect: EmptyWidget(text: 'Inscripciones = carrera'),
      ),
    ],
  ),
  MasterGroup(
    name: 'Organizacion',
    redirect: EmptyWidget(text: 'Organizacion'),
    elements: [
      MasterElement(
        name: 'bedelias',
        redirect: EmptyWidget(text: 'Organizacion = bedelias'),
      ),
      MasterElement(
        name: 'decano',
        redirect: EmptyWidget(text: 'Organizacion = decano'),
      ),
      MasterElement(
        name: 'evenconsejo estudiantil',
        redirect: EmptyWidget(text: 'Organizacion = evenconsejo estudiantil'),
      ),
      MasterElement(
        name: 'inco',
        redirect: EmptyWidget(text: 'Organizacion = inco'),
      ),
      MasterElement(
        name: 'bibloteca',
        redirect: EmptyWidget(text: 'Organizacion = bibloteca'),
      ),
      MasterElement(
        name: 'secretaria',
        redirect: EmptyWidget(text: 'Organizacion = secretaria'),
      ),
    ],
  ),
  MasterGroup(
    name: 'Consultas',
    redirect: EmptyWidget(text: 'Consultas'),
    elements: [
      MasterElement(
        name: 'planes de estudio',
        redirect: EmptyWidget(text: 'Consultas = planes de estudio'),
      ),
      MasterElement(
        name: 'previaturas',
        redirect: EmptyWidget(text: 'Consultas = previaturas'),
      ),
      MasterElement(
        name: 'calendario',
        redirect: EmptyWidget(text: 'Consultas = calendario'),
      ),
      MasterElement(
        name: 'escolaridad',
        redirect: EmptyWidget(text: 'Consultas = escolaridad'),
      ),
    ],
  ),
];

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
