class ProductId {
  final String name;
  final int productId;

  ProductId({
    required this.name,
    required this.productId,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        name: json["name"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "product_id": productId,
      };
}
