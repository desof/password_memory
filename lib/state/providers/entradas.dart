import 'dart:async';
import 'package:password_memory/state/models/entradas.dart';
import 'package:password_memory/utils/database_const.dart';
import 'package:password_memory/utils/database_sqflite.dart';
import 'package:rxdart/rxdart.dart';

class EntradasProvider {
  final BehaviorSubject<List<Entradas>> _entradas =
      BehaviorSubject<List<Entradas>>();

  DatabaseSqflite _db;

  Stream<List<Entradas>> get entradas => _entradas.stream;

  Function(List<Entradas>) get addentradas => _entradas.sink.add;

  EntradasProvider() {
    reset();
    _db = DatabaseSqflite();
    _getFromDatabase();
  }

  void close() {
    _entradas.close();
  }

  void reset() {
    addentradas([]);
  }

  Future<void> insertEntrada(Entradas entrada) async {
    int id = await _db.insert(T_ENTRADAS, entrada.toMap());
    Entradas p = Entradas(
        titulo: entrada.titulo,
        usuario: entrada.usuario,
        password: entrada.password,
        link: entrada.link,
        nota: entrada.nota,
        idGrupo: entrada.idGrupo,
        id: id);
    _entradas.value.add(p);
    addentradas(_entradas.value);
  }

  Future<void> updateentrada(Entradas entrada, int index) async {
    await _db.update(T_ENTRADAS, entrada.toMap(), entrada.id);
    // int index = _entradas.value.indexWhere((entrada p) {
    //   return p.id == entrada.id;
    // });
    _entradas.value.setAll(index, [entrada]);
    addentradas(_entradas.value);
  }

  Future<void> deleteentrada(int id) async {
    await _db.delete(T_ENTRADAS, id);
    _entradas.value.removeWhere((entrada) => entrada.id == id);
    addentradas(_entradas.value);
  }

  void _getFromDatabase() async {
    List entradasMap = await _db.getTable(T_ENTRADAS);
    List<Entradas> entradas = entradasMap
        .map((entradaMap) => Entradas(
            titulo: entradaMap['titulo'],
            usuario: entradaMap['usuario'],
            password: entradaMap['password'],
            link: entradaMap['link'],
            nota: entradaMap['nota'],
            idGrupo: entradaMap['idgrupo'],
            id: entradaMap['id']))
        .toList();
    addentradas(entradas);
  }
}
