import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class StockTab extends StatelessWidget {
  const StockTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
      ),
    );
  }
}
