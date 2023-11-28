import 'package:qg_stock_take_app/util/database_util.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models_export.dart';

class DatabaseOperations {
  final DatabaseUtil _dbo = DatabaseUtil();

  Future<void> setProducts(List<Product> products) async {
    for (Product product in products) {
      await setProduct(product);
    }
  }

  Future<void> setProduct(Product product) async {
    Map<String, Object?> contentValues = <String, Object?>{};
    contentValues.addAll({
      'name': product.name,
      'station_id': product.stationId,
      'no_of_pumps': product.noOfPumps,
      'product_id': product.productId
    });
    await _dbo.insertData('product', contentValues);
  }

  Product getProductFromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      stationId: map['station_id'],
      noOfPumps: map['no_of_pumps'],
      productId: map['product_id'],
    );
  }

  Future<List<Product>> getProducts() async {
    List<Map<String, dynamic>> result = await _dbo.getData('product');
    return result.map((map) => getProductFromMap(map)).toList();
  }

  Future<List<int>> getProductIds(String type) async {
    Database db = await _dbo.database;
    List<int> ids = [];
    List<Map<String, dynamic>> result = await db.query(
      'product',
      columns: ['product_id'],
      where: 'no_of_pumps = ?',
      whereArgs: [type],
    );

    ids = result.map((map) => map['product_id'] as int).toList();
    return ids;
  }

  // Remember to close the database when it's no longer needed.
  Future<void> closeDatabase() async {
    await _dbo.close();
  }
}
