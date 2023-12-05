import 'package:qg_stock_take_app/models/customer.dart';

class StationWarehouse {
  final CustomerId warehouse;

  StationWarehouse({
    required this.warehouse,
  });

  factory StationWarehouse.fromJson(Map<String, dynamic> json) =>
      StationWarehouse(
        warehouse: CustomerId.fromJson(json["warehouse"]),
      );

  Map<String, dynamic> toJson() => {
        "warehouse": warehouse.toJson(),
      };
}
