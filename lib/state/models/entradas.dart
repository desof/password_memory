import 'dart:convert';
import 'package:password_memory/utils/database_const.dart';


class Entradas {
  final int id;
  final String titulo;
  final String usuario;
  final String password;
  final String link;
  final String nota;
  final String idGrupo;

  Entradas({
    this.id,
    this.titulo,
    this.usuario,
    this.password,
    this.link,
    this.nota,
    this.idGrupo,
  });

  Map<String, dynamic> toMap() {
    return {
      C_ID_EN: this.id,
      C_TITULO_EN: this.titulo,
      C_USUARIO_EN: this.usuario,
      C_PASSWORD_EN: this.password,
      C_LINK_EN: this.link,
      C_NOTA_EN: this.nota,
      C_ID_GRUPO_EN: this.idGrupo,
    };
  }

  factory Entradas.fromMap(Map map) {
    return Entradas(
      id: json.decode(map[C_ID_EN]),
      titulo: json.decode(map[C_TITULO_EN]),
      usuario: json.decode(map[C_USUARIO_EN]),
      password: json.decode(map[C_USUARIO_EN]),
      link: json.decode(map[C_LINK_EN]),
      nota: json.decode(map[C_NOTA_EN]),
      idGrupo: json.decode(map[C_ID_GRUPO_EN]),
    );
  }
}
