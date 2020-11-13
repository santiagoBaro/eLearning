import 'dart:ui';

import 'package:flutter/material.dart';

import 'hex_color.dart';

class Content {
  int id;
  String titulo;
  Color color;

  Content({
    this.color,
    this.id,
    this.titulo,
  });

  Content.fromJson(Map<String, dynamic> json)
      : id = json['"Libro"']['id'],
        color = HexColor.fromHex(json['"Libro"']['color']),
        titulo = json['Libro']['titulo'];

  Content.fromNestedJson(Map<String, dynamic> json)
      : id = json['id'],
        color = HexColor.fromHex(json['color']),
        titulo = json['titulo'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'color': color.toHex(),
      };

  Map<String, dynamic> toNestedJson() => {
        "Libro": {
          "titulo": titulo,
          "color": color.toHex(),
        }
      };
}

Content contenidoRelleno = Content(
  color: Colors.amberAccent,
  titulo: "Practico",
  id: 0,
);
