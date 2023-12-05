class CustomerId {
  final String name;
  final int id;

  CustomerId({
    required this.name,
    required this.id,
  });

  factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
