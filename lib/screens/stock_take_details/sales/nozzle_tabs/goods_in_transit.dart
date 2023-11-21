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
                getDropDownForm('Select product', [
                  'Select product',
                  'Diesel',
                  'Super',
                ]),
                getDropDownForm(
                  'From: ',
                  ['From: ', 'Depot', 'Station'],
                ),
                getField(
                  'Invoice Number',
                  Colors.black38,
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                getField(
                  'Truck Number',
                  Colors.black38,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                getText(
                  'Price on Delivery Note',
                ),
                getField(
                  '0.0',
                  Colors.black,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                getText(
                  'Expected Discharge',
                ),
                getField(
                  '0.0',
                  Colors.black,
                ),
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: getProportionateScreenHeight(100),
                    color: primaryColor3.withOpacity(.6),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.black38,
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                getField(
                  'Comment',
                  Colors.black38,
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
  TextField getField(String hint, Color color) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: color,
          fontSize: getProportionateScreenHeight(18),
        ),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
