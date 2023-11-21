import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';

class DAMSA extends StatefulWidget {
  final String title;
  const DAMSA({super.key, required this.title});

  @override
  State<DAMSA> createState() => _DAMSAState();
}

class _DAMSAState extends State<DAMSA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DAMSA(${widget})',
        ),
        backgroundColor: primaryColor,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'SUBMIT',
              style: TextStyle(
                color: colorWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
