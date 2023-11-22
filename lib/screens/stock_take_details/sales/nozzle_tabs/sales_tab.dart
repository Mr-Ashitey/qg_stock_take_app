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
                  getVolumeRemaining(
                    -600.0,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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

// this method gets the volume remaining and returns it
  Text getVolumeRemaining(double volumeRemaining) {
    return Text(
      'Volume Remaining(Litres): $volumeRemaining',
      textAlign: TextAlign.right,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getProportionateScreenHeight(13),
      ),
    );
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
