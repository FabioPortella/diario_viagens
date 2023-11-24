import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class SQLiteDataBase {
  Map<int, String> scripts = {
    1: ''' CREATE TABLE viagens (
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         local TEXT,
         inicio TEXT,
         final TEXT,
         encerrada INTEGER
         );''',
    2: '''
      CREATE TABLE foto (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      local_foto TEXT,
      data_foto TEXT,
      midia TEXT, 
      descricao TEXT,
      id_viagem INTEGER,
      FOREIGN KEY (id_viagem) REFERENCES viagens(id) ON DELETE CASCADE
  );'''
  };

  static Database? db;

  Future<Database> obterDataBase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  Future<Database> iniciarBancoDeDados() async {
    var db = await openDatabase(
        path.join(await getDatabasesPath(), 'database.db'),
        version: scripts.length, onCreate: (Database db, int version) async {
      for (var i = 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint(scripts[i]!);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugPrint(scripts[i]!);
      }
    });
    return db;
  }
}
