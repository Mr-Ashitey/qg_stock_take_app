class Product {
  String name;
  int noOfPumps;
  int productId;
  int stationId;

  Product({
    required this.name,
    required this.noOfPumps,
    required this.productId,
    required this.stationId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
