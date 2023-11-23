import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class SignedDocument extends StatelessWidget {
  const SignedDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signed Document'),
        backgroundColor: primaryColor,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('SUBMIT'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              'Take a Picture of Signed Document',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                width: double.infinity,
                color: primaryColor3.withOpacity(.6),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.black38,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
