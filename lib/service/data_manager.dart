import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/todo_model.dart';

class DataManager {
  static DataManager material = DataManager._internal();
  DataManager._internal();
  factory DataManager() {
    return material;
  }

  Future<List<Map<String, dynamic>>> _getTodoMaps() async {
    Database db = await this.db;
    return await db.query("todos");
  }

  Future<List<TodoModel>> getTodos(bool isDone) async {
    final mapsList = await _getTodoMaps();
    List<TodoModel> todoList = [];
    for (var element in mapsList) {
      todoList.add(TodoModel.fromMap(element));
    }
    if (isDone) {
      return todoList.where((element) => !element.isDone).toList();
    }
    return todoList.where((element) => element.isDone).toList();
  }

  static Database? _db;
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
        'CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isDone INTEGER)');
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

  Future<int> delete(int id) async {
    Database db = await this.db;
    return await db.delete("todos", where: 'id = ?', whereArgs: [id]);
  }
}
