import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class GoodsInTransit extends StatefulWidget {
  const GoodsInTransit({super.key});

  @override
  State<GoodsInTransit> createState() => _GoodsInTransitState();
}

class _GoodsInTransitState extends State<GoodsInTransit>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildSpeedDial(),
      body: const Center(child: Text('Goods in transit')),
    );
  }

  @override
  bool get wantKeepAlive => true;

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22.0),
      backgroundColor: colorYellow,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.edit_outlined, color: Colors.white),
          backgroundColor: colorLightBlue,
          onTap: _showDialog,
          label: 'Manual Discharge',
          labelStyle: TextStyle(color: colorWhite),
          labelBackgroundColor: Colors.grey[700],
        ),
        SpeedDialChild(
          child: const Icon(Icons.qr_code, color: Colors.white),
          backgroundColor: colorLightBlue,
          onTap: () {},
          label: 'Scan QR code',
          labelStyle: TextStyle(color: colorWhite),
          labelBackgroundColor: Colors.grey[700],
        ),
      ],
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Add Goods In Transit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
            content: Column(
              crossAxisAlignment: crossStart,
              children: [
                getDropDownForm('Select product',
                    ['Select product', 'product 1', 'product 2', 'product 3']),
                getDropDownForm(
                  'From: Depot',
                  ['From: Depot', 'Depot 1', 'Depot 2', 'Depot 3'],
                ),
                getField(
                  'Invoice Number',
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                getField(
                  'Truck Number',
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                getText(
                  'Price on Delivery Note',
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                getReading(
                  0.0,
                ),
                const Divider(color: Colors.black38),
                SizedBox(height: getProportionateScreenHeight(5)),
                getText(
                  'Expected Discharge',
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                getReading(
                  0.0,
                ),
                const Divider(color: Colors.black38),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'Take a Picture of Delivery Note',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenHeight(16),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  alignment: Alignment.center,
                  height: getProportionateScreenHeight(100),
                  color: primaryColor3.withOpacity(.6),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.black38,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                getField(
                  'Comment',
                ),
              ],
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

// method to get reading on delivery note and expected discharge
  Text getReading(double reading) {
    return Text(
      "$reading",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

// method to get text header of fields that are not textfields
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

// method for dropdown menu in alert dialog
  DropdownButtonFormField<String> getDropDownForm(
    String dropdownValue,
    List<String> items,
  ) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(border: InputBorder.none),
      value: dropdownValue,
      items: items.map((String value) {
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
    );
  }

//this method is for the textfields in the alert dialog box
  TextField getField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: getProportionateScreenHeight(18),
        ),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
