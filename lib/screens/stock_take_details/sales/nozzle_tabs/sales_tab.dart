import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage>
    with AutomaticKeepAliveClientMixin {
  final List<String> saleTypes = [
    'Cash sales',
    'Credit sales',
    'Genset sales',
    'Fuel Coupon',
  ];
  String defaultItem = 'Select sales type';

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
      body: const Center(
        child: Text('Sales page'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            surfaceTintColor: Colors.white,
            scrollable: true,
            title: Text(
              'Add Sale',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(border: InputBorder.none),
                    value: defaultItem,
                    items: [
                      'Select sales type',
                      'Cash sales',
                      'Credit sales',
                      'Genset sales',
                      'Fuel coupon',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        defaultItem = value!;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Volume',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: getProportionateScreenHeight(15),
                      ),
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Unit Price',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: getProportionateScreenHeight(15),
                      ),
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
