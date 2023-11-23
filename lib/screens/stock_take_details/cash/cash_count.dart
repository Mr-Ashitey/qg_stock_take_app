import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class CashCount extends StatelessWidget {
  const CashCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  getNumFieldText('200 Note'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNumFieldText('100 Note'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNumFieldText('50 Note'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNumFieldText('20 Note'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNumFieldText('10 Note'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNumFieldText('5 Note'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNumFieldText('2 Note'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNumFieldText('1 Note'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNumFieldText('2 Coin'),
                  getFieldText(),
                  getQuantityTotal(0.0),
                ]),
                TableRow(
                  children: [
                    getNumFieldText('1 Coin'),
                    getFieldText(),
                    getQuantityTotal(0.0),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: getProportionateScreenHeight(80),
          color: Colors.black87,
          child: Column(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: mainSpaceEvenly,
            children: [getAmount('Note', 0.0), getAmount('Coin', 0.0)],
          ),
        ),
      ),
    );
  }

  Text getAmount(String currency, double totalAmount) {
    return Text(
      'Total $currency Amount: ₵ $totalAmount',
      style: TextStyle(
        color: colorWhite,
        fontSize: getProportionateScreenHeight(19),
        fontFamily: '', // to make the currency symbol show
      ),
    );
  }

  Padding getFieldText() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            'Quantity',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(12),
              color: Colors.black38,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0.0',
              hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(15),
              ),
              border: const UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(5))
        ],
      ),
    );
  }

  Text getNumFieldText(String value) {
    return Text(
      "₵$value",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getProportionateScreenHeight(18),
        fontFamily: '', // to make the currency symbol show
      ),
    );
  }

  Padding getQuantityTotal(double total) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Text(
        '$total',
        textAlign: TextAlign.end,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: getProportionateScreenHeight(18),
        ),
      ),
    );
  }
}
