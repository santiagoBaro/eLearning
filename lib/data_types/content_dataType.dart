import 'dart:ui';

import 'package:flutter/material.dart';

class Content {
  int id;
  String titulo;
  String color;

  Content({
    this.color,
    this.id,
    this.titulo,
  });

  Content.fromNestedJson(Map<String, dynamic> json)
      : id = json['"Libro"']['_id'] ?? 0,
        color = json['"Libro"']['color'] ?? "",
        titulo = json['Libro']['titulo'] ?? "";

  Content.fromJson(Map<String, dynamic> json)
      : id = json['_id'] ?? 0,
        color = json['color'] ?? "",
        titulo = json['titulo'] ?? "";

  Map<String, dynamic> toJson() => {
        '_id': id,
        'titulo': titulo,
        'color': color,
      };

  Map<String, dynamic> toNestedJson() => {
        "Libro": {
          "titulo": titulo,
          "color": color,
        }
      };
}

Content contenidoRelleno = Content(
  color: "0xFF005377",
  titulo: "Practico",
  id: 0,
);
