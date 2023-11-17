import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        toolbarHeight: getProportionateScreenHeight(60),
        backgroundColor: primaryColor,
        title: Text(
          'Kasoa Akweley F/S 2.0v',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: colorWhite,
          ),
        ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                'Stock for: Dec 13,2019',
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(19),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              buildSaleCard(
                title: 'Power Diesel',
                grandTotal: 0.00,
                credit: 0.00,
                creditSale: 0.00,
                cashSale: 0.00,
                gensetSale: 0.00,
                fuelCoupon: 0.00,
                onPressed: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              buildDamsaCard(
                title: 'DAMSA(Power Diesel)',
                tank: 'DT1',
                variation: 0,
                onPressed: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              buildSaleCard(
                title: 'Power Super',
                grandTotal: 0.00,
                credit: 0.00,
                creditSale: 0.00,
                cashSale: 0.00,
                gensetSale: 0.00,
                fuelCoupon: 0.00,
                onPressed: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              buildDamsaCard(
                title: 'DAMSA(Power Super)',
                tank: 'ST1',
                variation: 0,
                onPressed: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                  fixedSize:
                      Size(double.maxFinite, getProportionateScreenHeight(140)),
                  backgroundColor: colorLightBlue2,
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
                    const Spacer(),
                    Center(
                      child: Text(
                        'Stock Loss',
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(17),
                          color: colorWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildSaleCard(
      {required String title,
      required double grandTotal,
      required double credit,
      required double creditSale,
      required double cashSale,
      required double gensetSale,
      required double fuelCoupon,
      // Color color,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
        backgroundColor: colorDeepBlue1,
      ),
      child: Column(
        // mainAxisAlignment: mainSpaceBetween,
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
                fontSize: getProportionateScreenHeight(17),
                color: colorWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'Grand Total: $grandTotal',
          ),
          Text(
            'Credit Sale: $creditSale',
          ),
          Text(
            'Cash Sale: $cashSale',
          ),
          Text(
            'Genset Sale: $gensetSale',
          ),
          Text('Fuel Coupon: $fuelCoupon')
        ],
      ),
    );
  }

  ElevatedButton buildDamsaCard({
    required String title,
    required String tank,
    required double variation,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
        backgroundColor: colorDeepBlue2,
      ),
      child: Column(
        // mainAxisAlignment: mainSpaceBetween,
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
                fontSize: getProportionateScreenHeight(17),
                color: colorWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text('Variation for $tank: $variation'),
          Text('Variation for $tank: $variation'),
          SizedBox(height: getProportionateScreenHeight(35)),
        ],
      ),
    );
  }
}
