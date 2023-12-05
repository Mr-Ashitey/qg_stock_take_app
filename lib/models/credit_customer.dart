import 'package:qg_stock_take_app/models/customer.dart';

class CreditCustomer {
  final CustomerId customerId;
  final bool activeState;

  CreditCustomer({
    required this.customerId,
    required this.activeState,
  });

  factory CreditCustomer.fromJson(Map<String, dynamic> json) => CreditCustomer(
        customerId: CustomerId.fromJson(json["customer_id"]),
        activeState: json["active_state"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId.toJson(),
        "active_state": activeState,
      };
}
