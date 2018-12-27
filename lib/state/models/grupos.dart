import 'dart:convert';
import 'package:password_memory/utils/database_const.dart';


class Grupos {
  final int id;
  final String nombre;
  final String color;
 

  Grupos({
    this.id,
    this.nombre,
    this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      C_ID_GR: this.id,
      C_NOMBRE_GR: this.nombre,
      C_COLOR_GR: this.color,        
    };
  }

  factory Grupos.fromMap(Map map) {
    return Grupos(
      id: json.decode(map[C_ID_GR]),
      nombre: json.decode(map[C_NOMBRE_GR]),
      color: json.decode(map[C_COLOR_GR]),

    );
  }
}