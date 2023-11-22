import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class CashCount extends StatelessWidget {
  const CashCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: mainSpaceBetween,
          children: [
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  getNoFieldText('200 Note'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('100 Note'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('50 Note'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('20 Note'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('10 Note'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('5 Note'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('2 Note'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('1 Note'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(children: [
                  getNoFieldText('2 Coin'),
                  getFieldText(),
                  getTotal(0.0),
                ]),
                TableRow(
                  children: [
                    getNoFieldText('1 Coin'),
                    getFieldText(),
                    getTotal(0.0),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding getFieldText() {
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
            ),
          ),
        ],
      ),
    );
  }

  Padding getTotal(double total) {
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
