import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

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
          'DAMSA(${widget.title})',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Opening Dip'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(
              790.00,
            ),
            const Divider(
              color: Colors.black26,
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            getText('Closing dip'),
            getField(
              '0.0',
              Colors.black,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            getField(
              'Water Level',
              Colors.black38,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Actual Product Volume'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(
              0.00,
            ),
            const Divider(
              color: Colors.black26,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Station Transfer'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(
              0.00,
            ),
            const Divider(
              color: Colors.black26,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('WholeSale'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(
              0.00,
            ),
            const Divider(
              color: Colors.black26,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Sales Dip'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(
              790.00,
            ),
            const Divider(
              color: Colors.black26,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Sales(Meter)'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(
              -600.00,
            ),
            const Divider(
              color: Colors.black26,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            getText('Variation(LTRS)'),
            SizedBox(height: getProportionateScreenHeight(10)),
            getReading(
              -1390.00,
            ),
            const Divider(
              color: Colors.black26,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            getField(
              'Cumulative Variance(LTRS)',
              Colors.black38,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            )
          ],
        ),
      ),
    );
  }

  Text getReading(double reading) {
    return Text(
      "$reading",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

// method to get text header of some fields
  Text getText(
    String text,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontSize: getProportionateScreenHeight(12),
        fontWeight: FontWeight.bold,
        color: Colors.black38,
      ),
    );
  }

// method for the various textfields
  TextField getField(
    String hint,
    Color color,
  ) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: getProportionateScreenHeight(18),
        ),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
