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
      C_ID_PW: this.id,
      C_TITULO_PW: this.titulo,
      C_USUARIO_PW: this.usuario,
      C_PASSWORD_PW: this.password,
      C_LINK_PW: this.link,
      C_NOTA_PW: this.nota,
      C_GRUPO_PW: this.idGrupo,
    };
  }

  factory Entradas.fromMap(Map map) {
    return Entradas(
      id: json.decode(map[C_ID_PW]),
      titulo: json.decode(map[C_TITULO_PW]),
      usuario: json.decode(map[C_USUARIO_PW]),
      password: json.decode(map[C_USUARIO_PW]),
      link: json.decode(map[C_LINK_PW]),
      nota: json.decode(map[C_NOTA_PW]),
      idGrupo: json.decode(map[C_GRUPO_PW]),
    );
  }
}
