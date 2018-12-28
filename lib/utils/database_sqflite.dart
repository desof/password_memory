import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'database_const.dart';

class DatabaseSqflite {
  static final DatabaseSqflite _instance = DatabaseSqflite.internal();
  factory DatabaseSqflite() => _instance;

  static Database _db;
  DatabaseSqflite.internal();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'passwords.db');

    //ELIMINAR BASE DE DATOS//
    //await deleteDatabase(path);

    Database db = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await _onUpgrade(db, 0, newVersion);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 1) {
      await db.execute(
        'CREATE TABLE $T_ENTRADAS($C_ID_PW INTEGER PRIMARY KEY, $C_TITULO_PW TEXT, $C_USUARIO_PW TEXT, $C_PASSWORD_PW TEXT, $C_LINK_PW TEXT, $C_NOTA_PW TEXT, $C_GRUPO_PW TEXT)',
      );
       await db.execute(
        'CREATE TABLE $T_GRUPOS($C_ID_GR INTEGER PRIMARY KEY, $C_NOMBRE_GR TEXT, $C_COLOR_GR TEXT)',
      );
    }
  }

  // Métodos
  Future<List> getTable(String table) async {
    Database dbClient = await db;
    List result = await dbClient.query(table);

    return result.toList();
  }

  Future<List> getProductsByCategoryId(String categoryId) async {
    Database dbClient = await db;
    return await dbClient
        .query(T_ENTRADAS, where: '$C_ID_GR = ?', whereArgs: [categoryId]);
  }

  Future<int> getCount(String table) async {
    Database dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> insert(String table, Map options) async {
    Database dbClient = await db;
    return await dbClient.insert(table, options);
  }

  Future<int> update(String table, Map options, int id) async {
    Database dbClient = await db;
    return await dbClient
        .update(table, options, where: '$C_ID_PW = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    Database dbClient = await db;
    return await dbClient.delete(table, where: '$C_ID_PW = ?', whereArgs: [id]);
  }

  Future<dynamic> close() async {
    Database dbClient = await db;
    return dbClient.close();
  }
}
