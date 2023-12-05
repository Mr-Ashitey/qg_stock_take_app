class Bank {
  final int bankId;
  final String name;

  Bank({
    required this.bankId,
    required this.name,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        bankId: json["bank_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "bank_id": bankId,
        "name": name,
      };
}
