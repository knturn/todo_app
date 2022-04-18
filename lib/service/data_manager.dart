import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/todo_model.dart';

class DataManager {
  static Database? _db;

  Future<List<Map<String, dynamic>>> getTodoMaps() async {
    Database db = await this.db;
    return await db.query("todos");
  }

  Future<List<TodoModel>> getTodos() async {
    final mapsList = await getTodoMaps();
    List<TodoModel> todoList = [];
    mapsList.forEach((element) {
      todoList.add(TodoModel.fromMap(element));
    });
    return todoList;
  }

  Future<Database> get db async {
    // ignore: prefer_conditional_assignment
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

  Future<int> addTodo(TodoModel todoModel) async {
    Database db = await this.db;

    return await db.insert("todos", todoModel.toMap());
  }

  Future<int> uptadeIsDone(TodoModel todoModel) async {
    Database db = await this.db;
    return await db.update("todos", todoModel.toMap(),
        where: "db=?", whereArgs: [todoModel.id]);
  }
}
