import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                'Stock for: Dec 13,2019',
                style: TextStyle(fontSize: getProportionateScreenHeight(20)),
              ),
              InkWell(
                child: Card(
                  color: colorDeepBlue1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
