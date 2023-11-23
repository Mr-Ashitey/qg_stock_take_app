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
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  getNoFieldText('200 Note'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('100 Note'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('50 Note'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('20 Note'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('10 Note'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('5 Note'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('2 Note'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('1 Note'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('2 Coin'),
                  getFieldText(TextInputType.number),
                  getQuantityTotal(0.0),
                ]),
                TableRow(
                  children: [
                    getNoFieldText('1 Coin'),
                    getFieldText(TextInputType.number),
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
          height: 100,
          color: Colors.black87,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              SizedBox(height: getProportionateScreenHeight(15)),
              getAmount('Note', 0.0),
              SizedBox(height: getProportionateScreenHeight(10)),
              getAmount('Coin', 0.0)
            ],
          ),
        ),
      ),
    );
  }

  Text getAmount(String currency, double totalAmount) {
    return Text(
      'Total $currency Amount: ₵$totalAmount',
      style: TextStyle(
        color: colorWhite,
        fontSize: getProportionateScreenHeight(20),
        fontFamily: '', // to make the currency symbol show
      ),
    );
  }

  Padding getFieldText(TextInputType keyboard) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Quantity',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black38,
          ),
        ),
        TextField(
          keyboardType: keyboard,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            hintText: '0.0',
            hintStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(15),
            ),
            border: const UnderlineInputBorder(),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        )
      ]),
    );
  }

  Padding getNoFieldText(String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Text(
            "₵$value",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(18),
              fontFamily: '', // to make the currency symbol show
            ),
          ),
        ],
      ),
    );
  }

  Padding getQuantityTotal(double total) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: crossEnd,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Text(
            '$total',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: getProportionateScreenHeight(18),
            ),
          ),
        ],
      ),
    );
  }
}
