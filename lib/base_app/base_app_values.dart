import 'package:flutter/cupertino.dart';
import 'tools/visual_assets.dart';

final BaseAppValues myAppValues = BaseAppValues(
  appName: 'eLearning',
  homepage: EmptyWidget(text: 'Home Page'),
  onboardingTextStyle: TextStyle(
    fontFamily: 'NatureBeauty',
    fontSize: 18,
    color: myAppTheme['SecondaryTextColor'],
    shadows: [
      textShadow,
      textHilight,
    ],
  ),
  mainGradient: LinearGradient(
    colors: eLearningMainGradient,
    stops: stops2colors,
    begin: Alignment.topLeft,
    end: Alignment.center,
  ),
  groups: [
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
  ],
  onboarding: [
    OnboardingSlide(
      imgUrl: 'asstes/images/mente.png',
      message: 'La Mejor Manera De Aprender',
    ),
    OnboardingSlide(
      imgUrl: 'asstes/images/transporte.png',
      message: 'No Importa El Lugar',
    ),
    OnboardingSlide(
      imgUrl: 'asstes/images/huvo.png',
      message: 'Sigue El Progreso',
    ),
  ],
);

class BaseAppValues {
  final String appName;
  final Gradient mainGradient;
  final Widget homepage;
  final List<MasterGroup> groups;
  final Map<String, Color> theme;
  final List<OnboardingSlide> onboarding;
  final TextStyle usernameTextStyle;
  final TextStyle groupTextStyle;
  final TextStyle elementTextStyle;
  final TextStyle onboardingTextStyle;

  BaseAppValues({
    this.appName,
    this.mainGradient,
    this.homepage,
    this.groups,
    this.theme,
    this.onboarding,
    this.usernameTextStyle,
    this.groupTextStyle,
    this.elementTextStyle,
    this.onboardingTextStyle,
  });
}

class OnboardingSlide {
  final String imgUrl;
  final String message;

  OnboardingSlide({this.imgUrl, this.message});
}

class MasterGroup {
  final String name;
  final List<MasterElement> elements;
  final Widget redirect;

  MasterGroup({
    this.name,
    this.elements,
    this.redirect,
  });
}

class MasterElement {
  final String name;
  final int notifications;
  final Widget redirect;

  MasterElement({
    this.name,
    this.notifications,
    this.redirect,
  });
}

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({Key key, this.text = 'Empty Widget'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
