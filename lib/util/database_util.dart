import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'create_queries.dart';

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
    // with the create queries in the lib/util/create_queries.dart file
    await db.execute(createProductTableQuery);
    await db.execute(createSaleOrderTableQuery);
    await db.execute(createDamsaTableQuery);
    await db.execute(createDischargeTableQuery);
    await db.execute(createGoodsInTransitTableQuery);
    await db.execute(createCreditSaleTableQuery);
    await db.execute(createCustomerTableQuery);
    await db.execute(createPumpTableQuery);
    await db.execute(createBankTransactionTableQuery);
    await db.execute(createExpenseTableQuery);
    await db.execute(createBankTableQuery);
    await db.execute(createAuthorizedByTableQuery);
    await db.execute(createExpenseReasonsTableQuery);
    await db.execute(createWarehouseTableQuery);
    await db.execute(createMasterReportTableQuery);
    await db.execute(createTransferTableQuery);
    await db.execute(createTankGroupTableQuery);
    await db.execute(createTankTableQuery);
    await db.execute(createTankDischargeTableQuery);
    await db.execute(createImageTableQuery);
    await db.execute(createNozzleResetTableQuery);
    await db.execute(createTankResetTableQuery);
    await db.execute(createDensityTemperatureTableQuery);
    await db.execute(createRttTableQuery);
    await db.execute(createStockLossTableQuery);
    await db.execute(createCashCountTableQuery);
    await db.execute(createUnbankedSaleTableQuery);
    await db.execute(createLubesTableQuery);
    await db.execute(createLubeCategoryTableQuery);
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
