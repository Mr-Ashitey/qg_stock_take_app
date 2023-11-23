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
            getText('Dehydrated Closing Dips'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(780.00),
            divider(),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Meter Sales'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(200.00),
            divider(),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Adjusted Dehydrated Closing Dips'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(980.00),
            divider(),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('ERP Inventory At Date In Litres'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(990.00),
            divider(),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('ERP Inventory Valuation In Litres'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(990.00),
            divider(),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('ERP Inventory At Date In GHC'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(5000.00),
            divider(),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Stock Loss In Litres'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(10.00),
            divider(),
          ],
        ),
      ),
    );
  }

  Divider divider() {
    return const Divider(
      color: Colors.black26,
    );
  }

// get reading from the data
  Text getReading(double reading) {
    return Text(
      "$reading",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

// method to get text header of some fields
  Text getText(
    String text,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontSize: getProportionateScreenHeight(11),
        fontWeight: FontWeight.bold,
        color: Colors.black38,
      ),
    );
  }
}
