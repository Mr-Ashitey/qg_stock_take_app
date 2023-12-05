import 'package:qg_stock_take_app/models/customer.dart';

class StationExpenseCategory {
  final CustomerId expenseCategory;

  StationExpenseCategory({
    required this.expenseCategory,
  });

  factory StationExpenseCategory.fromJson(Map<String, dynamic> json) =>
      StationExpenseCategory(
        expenseCategory: CustomerId.fromJson(json["expense_category"]),
      );

  Map<String, dynamic> toJson() => {
        "expense_category": expenseCategory.toJson(),
      };
}
