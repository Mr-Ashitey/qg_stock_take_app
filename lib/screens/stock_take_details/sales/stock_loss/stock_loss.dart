import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/stock_loss/stock_tab.dart';

class StockLoss extends StatefulWidget {
  const StockLoss({super.key});

  @override
  State<StockLoss> createState() => _StockLossState();
}

class _StockLossState extends State<StockLoss>
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
          'Stock Loss',
        ),
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: getProportionateScreenHeight(14)),
          indicatorWeight: 3,
          controller: tabController,
          tabs: const [
            Text('DT1'),
            Text('ST1'),
            Text('ST2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          StockTab(),
          StockTab(),
          StockTab(),
        ],
      ),
    );
  }
}
