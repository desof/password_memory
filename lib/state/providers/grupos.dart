import 'dart:async';
import 'package:password_memory/state/models/grupos.dart';
import 'package:password_memory/utils/database_const.dart';
import 'package:password_memory/utils/database_sqflite.dart';
import 'package:rxdart/rxdart.dart';

class GruposProviders {
  final BehaviorSubject<List<Grupos>> _grupos =
      BehaviorSubject<List<Grupos>>();
final BehaviorSubject<String> _valueExample = BehaviorSubject<String>();

  DatabaseSqflite _db;

  Stream<List<Grupos>> get grupos => _grupos.stream;
  Stream<String> get valueExample => _valueExample.stream;


  Function(List<Grupos>) get addGrupos => _grupos.sink.add;
  Function(String) get addValue => _valueExample.sink.add;

  GruposProviders() {
    reset();
    _db = DatabaseSqflite();
    _getFromDatabase();
  }

  void close() {
    _valueExample.close();
    _grupos.close();
  }

  void reset() {
    addGrupos([]);
  }

  Future<void> insertgrupo(Grupos grupo) async {
    int id = await _db.insert(T_GRUPOS, grupo.toMap());
    Grupos p = Grupos(
        nombre: grupo.nombre,
        color: grupo.color, 
        id: id);
    _grupos.value.add(p);
    addGrupos(_grupos.value);
  }

  Future<void> updategrupo(Grupos grupo, int index) async {
    await _db.update(T_GRUPOS, grupo.toMap(), grupo.id);
    // int index = _grupos.value.indexWhere((grupo p) {
    //   return p.id == grupo.id;
    // });
    _grupos.value.setAll(index, [grupo]);
    addGrupos(_grupos.value);
  }

  Future<void> deletegrupo(int id) async {
    await _db.delete(T_GRUPOS, id);
    _grupos.value.removeWhere((grupo) => grupo.id == id);
    addGrupos(_grupos.value);
  }

  void _getFromDatabase() async {
    List gruposMap = await _db.getTable(T_GRUPOS);
    List<Grupos> grupos = gruposMap
        .map((grupoMap) => Grupos(
            nombre: grupoMap['nombre'],
            color: grupoMap['color'],
           
            id: grupoMap['id']))
        .toList();
    addGrupos(grupos);
  }
}
