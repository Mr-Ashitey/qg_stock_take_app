import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class CashInTill extends StatefulWidget {
  const CashInTill({super.key});

  @override
  State<CashInTill> createState() => _CashInTillState();
}

class _CashInTillState extends State<CashInTill> {
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        backgroundColor: colorYellow,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 40,
          color: Colors.black87,
          child: Text(
            'Total Amount: ₵ $totalAmount',
            style: TextStyle(
              color: colorWhite,
              fontSize: getProportionateScreenHeight(16),
              fontFamily: '', // to make the currency symbol show
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    double amountRemaining = 0.0;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            surfaceTintColor: Colors.white,
            scrollable: true,
            title: Text(
              'Add Unbanked Sale',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  getField('Date', TextInputType.datetime),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  getField('Amount', TextInputType.phone),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Amount Remaining: $amountRemaining',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(13),
                      ),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'CANCEL',
                  style: TextStyle(color: colorYellow),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'ADD',
                  style: TextStyle(color: colorYellow),
                ),
              ),
            ],
          );
        });
  }

  TextField getField(String hint, TextInputType keyboard) {
    return TextField(
      keyboardType: keyboard,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: getProportionateScreenHeight(15),
        ),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
