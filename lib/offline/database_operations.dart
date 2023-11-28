import 'package:qg_stock_take_app/offline/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models_export.dart';

class DatabaseOperations {
  final DatabaseHelper _dbo = DatabaseHelper();

  Future<void> setProducts(List<ProductModel> products) async {
    for (ProductModel product in products) {
      await setProduct(product);
    }
  }

  Future<void> setProduct(ProductModel product) async {
    Map<String, Object?> contentValues = <String, Object?>{};
    contentValues.addAll({
      'name': product.name,
      'station_id': product.stationId,
      'no_of_pumps': product.noOfPumps,
      'product_id': product.productId
    });
    await _dbo.insertData('product', contentValues);
  }

  ProductModel getProductFromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      stationId: map['station_id'],
      noOfPumps: map['no_of_pumps'],
      productId: map['product_id'],
    );
  }

  Future<List<ProductModel>> getProducts() async {
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
