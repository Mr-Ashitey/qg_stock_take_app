import 'package:qg_stock_take_app/models/expense_auth.dart';

class ExpenseSupervisor {
  final int expenseAuthId;
  final String name;
  final List<StationExpenseAuth> stationExpenseAuth;

  ExpenseSupervisor({
    required this.expenseAuthId,
    required this.name,
    required this.stationExpenseAuth,
  });

  factory ExpenseSupervisor.fromJson(Map<String, dynamic> json) =>
      ExpenseSupervisor(
        expenseAuthId: json["expense_auth_id"],
        name: json["name"],
        stationExpenseAuth: List<StationExpenseAuth>.from(
            json["station_expense_auth"]
                .map((x) => StationExpenseAuth.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "expense_auth_id": expenseAuthId,
        "name": [name],
        "station_expense_auth":
            List<dynamic>.from(stationExpenseAuth.map((x) => x.toJson())),
      };
}
