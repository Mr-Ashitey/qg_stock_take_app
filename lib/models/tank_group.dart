import 'package:qg_stock_take_app/models/nozzle.dart';

class TankGroup {
  final int id;
  final String name;
  final int productId;
  final List<Nozzle> tank;

  TankGroup({
    required this.id,
    required this.name,
    required this.productId,
    required this.tank,
  });

  factory TankGroup.fromJson(Map<String, dynamic> json) => TankGroup(
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        tank: List<Nozzle>.from(json["tank"].map((x) => Nozzle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_id": productId,
        "tank": List<dynamic>.from(tank.map((x) => x.toJson())),
      };
}
