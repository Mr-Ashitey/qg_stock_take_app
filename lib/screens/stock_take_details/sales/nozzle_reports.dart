import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/nozzle_tabs/goods_in_transit.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/nozzle_tabs/nozzle_item.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/nozzle_tabs/sales_tab.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales/nozzle_tabs/transfer_tab.dart';

class NozzlesScreen extends StatefulWidget {
  const NozzlesScreen({super.key});

  @override
  State<NozzlesScreen> createState() => _NozzlesScreenState();
}

class _NozzlesScreenState extends State<NozzlesScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Power Diesel',
        ),
        backgroundColor: primaryColor,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'SUBMIT',
              style: TextStyle(
                color: colorWhite,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          labelColor: colorYellow,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: getProportionateScreenHeight(14),
          ),
          labelPadding: const EdgeInsets.all(15),
          indicatorColor: colorYellow,
          unselectedLabelColor: colorWhite,
          indicatorWeight: 3,
          controller: tabController,
          tabs: const [
            Text('P2D1'),
            Text('P2D2'),
            Text('P3D1'),
            Text('P3D2'),
            Text('SALES'),
            Text('TRANSFER'),
            Text('GOODS IN TRANSIT'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          NozzleItem(),
          NozzleItem(),
          NozzleItem(),
          NozzleItem(),
          SalesPage(),
          TransferPage(),
          GoodsInTransit(),
        ],
      ),
    );
  }
}
