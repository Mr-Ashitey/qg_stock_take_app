import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class SalesSummary extends StatelessWidget {
  const SalesSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: crossStretch,
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            buildCard('PMS'),
            SizedBox(height: getProportionateScreenHeight(15)),
            buildCard('AGO'),
            SizedBox(height: getProportionateScreenHeight(15)),
            buildSalesCard('PMS'),
            SizedBox(height: getProportionateScreenHeight(15)),
            buildSalesCard('AGO'),
            SizedBox(height: getProportionateScreenHeight(15)),
            Container(
              padding: const EdgeInsets.all(12.0),
              color: colorGrey,
              // width: double.infinity,
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text(
                    'SUMMARY SALES FOR THE DAY',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'PMS Amount: 0.000',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(13),
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'AGO Amount: 0.000',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(13),
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Credit Sales: 0.000',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(13),
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCard(String title) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: colorGrey,
      // width: double.infinity,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Hydrated Closing Dips: 0.000',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(13),
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Water Level: 0.000',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(13),
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Dehydrated Closing Dips: 0.000',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(13),
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Goods In Transit: 0.000',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(13),
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Total Stock Loss: 0.000',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(13),
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Container buildSalesCard(String title) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: colorGrey,
      // width: double.infinity,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            '$title - Sales',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Litres: 0.000',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(13),
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Amount: 0.000',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(13),
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
