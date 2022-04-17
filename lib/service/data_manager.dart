import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataManager {
  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db!;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todo.db";
    final todoDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return todoDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)');
  }

  Future<int> addTodo() async {
    Database db = await this.db;
    var test = {"title": "Deneme1", "description": "Deneme1descrpisrin"};
    // ignore: avoid_print
    print("succeessed");
    return await db.insert("todos", test);
  }

  Future<void> readingSql() async {
    Database db = await this.db;
    var test = await db.query("todos");
    // ignore: avoid_print
    print(test);
  }
}
