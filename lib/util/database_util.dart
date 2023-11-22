import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseUtil {
  static final DatabaseUtil _instance = DatabaseUtil.internal();

  factory DatabaseUtil() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  DatabaseUtil.internal();

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'your_database_name.db');

    // Open the database
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create tables here
    await db.execute('''
      CREATE TABLE IF NOT EXISTS your_table_name (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
      )
    ''');
  }

  // Example of inserting data
  Future<int> insertData(String tableName, Map<String, dynamic> data) async {
    Database db = await database;
    return await db.insert(tableName, data);
  }

  // Example of querying data
  Future<List<Map<String, dynamic>>> getData(String tableName) async {
    Database db = await database;
    return await db.query(tableName);
  }

  // Example of updating data
  Future<int> updateData(String tableName, Map<String, dynamic> data) async {
    Database db = await database;
    return await db
        .update(tableName, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  // Example of deleting data
  Future<int> deleteData(String tableName, int id) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  // Close the database when it's no longer needed
  Future<void> close() async {
    Database db = await database;
    db.close();
  }
}
