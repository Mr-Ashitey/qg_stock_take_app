class ProductModel {
  String name;
  int noOfPumps;
  int productId;
  int stationId;

  ProductModel({
    required this.name,
    required this.noOfPumps,
    required this.productId,
    required this.stationId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      noOfPumps: json['noOfPumps'],
      productId: json['productId'],
      stationId: json['stationId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'noOfPumps': noOfPumps,
      'productId': productId,
      'stationId': stationId,
    };
  }
}
