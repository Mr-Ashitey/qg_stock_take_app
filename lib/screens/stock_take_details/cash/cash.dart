import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/cash/cash_count.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/cash/cash_in_till.dart';

import '../../../constants/colors.dart';
import '../../../constants/size_config.dart';

class CashPage extends StatefulWidget {
  const CashPage({super.key});

  @override
  State<CashPage> createState() => _CashPageState();
}

class _CashPageState extends State<CashPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Cash Count',
        ),
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: getProportionateScreenHeight(14)),
          indicatorWeight: 3,
          indicatorColor: colorYellow,
          controller: tabController,
          tabs: const [
            Text('CASH COUNT'),
            Text('PETTY CASH'),
            Text('CASH IN TILL'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const CashCount(),
          Container(),
          const CashInTill(),
        ],
      ),
    );
  }
}
