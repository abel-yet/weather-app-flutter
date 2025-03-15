import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "search_history.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute("""
      CREATE TABLE history(
        text TEXT PRIMARY KEY
      )
    """);
  }

  Future<List<Map<String,dynamic>>> getHistory() async {
    Database db = await database;
    return await db.query('history');
  }

  Future<int> addHistory(String text) async {
    Database db = await database;
    return await db.insert('history', {"text" : text}, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> removeHistory(String text) async {
    Database db = await database;
    return await db.delete('history', where: "text = ?", whereArgs: [text]);
  }

}
