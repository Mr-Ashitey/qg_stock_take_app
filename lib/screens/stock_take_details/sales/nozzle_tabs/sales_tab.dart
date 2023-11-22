import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class SalesTab extends StatefulWidget {
  const SalesTab({super.key});

  @override
  State<SalesTab> createState() => _SalesTabState();
}

class _SalesTabState extends State<SalesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        backgroundColor: colorYellow,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: null,
    );
  }

  @override
  bool get wantKeepAlive => true;

// shows alert dialog box once floating action button is clicked
  void _showDialog() {
    String dropdownValue = 'Select sales type';
    double volumeRemaining = -600.0;

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
                    value: dropdownValue,
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
                        dropdownValue = value!;
                      });
                    },
                  ),
                  getField(
                    'Volume',
                  ),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  getField(
                    'Unit Price',
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Text(
                    'Volume Remaining(Litres): $volumeRemaining',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(13),
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

//this method is for the textfields in the alert dialog box
  TextField getField(String hint) {
    return TextField(
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
