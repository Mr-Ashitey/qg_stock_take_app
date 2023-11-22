import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/size_config.dart';

class CashPage extends StatefulWidget {
  const CashPage({super.key});

  @override
  State<CashPage> createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  late TabController tabController;

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
        children: const [
          // StockTab(),
          // StockTab(),
          // StockTab(),
        ],
      ),
    );
  }
}
