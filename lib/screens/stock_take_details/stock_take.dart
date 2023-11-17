import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/sales.dart';

class StockTakeScreen extends StatelessWidget {
  const StockTakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: const Text('Kasoa Akweley F/S 2.0v'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildCard(
                title: 'Sales',
                color: primaryColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalesScreen()));
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              buildCard(
                title: 'Cash',
                color: primaryColor2,
                onPressed: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              buildCard(
                title: 'Sales Summary',
                color: primaryColor3,
                onPressed: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              buildCard(
                title: 'Signed Document',
                color: primaryColor3,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildCard(
      {required String title,
      required Color color,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.only(top: 20, left: 10),
        backgroundColor: color,
        fixedSize: Size(
          double.maxFinite,
          getProportionateScreenHeight(150),
        ),
      ),
      child: Column(
        mainAxisAlignment: mainSpaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.help_outline,
              color: primaryDarkColor,
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: getProportionateScreenHeight(18),
                color: colorWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(),
          const SizedBox()
        ],
      ),
    );
  }
}
