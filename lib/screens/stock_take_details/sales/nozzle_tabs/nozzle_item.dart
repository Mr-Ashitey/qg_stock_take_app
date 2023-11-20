import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';

class NozzleItem extends StatefulWidget {
  const NozzleItem({super.key});

  @override
  State<NozzleItem> createState() => _NozzleItemState();
}

class _NozzleItemState extends State<NozzleItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          SizedBox(height: getProportionateScreenHeight(8)),
          Text(
            'Take a Picture of Closing Meter',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(15),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(7),
              height: getProportionateScreenHeight(100),
              width: double.infinity,
              color: primaryColor3.withOpacity(.6),
              child: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.black38,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          getText(
            'Opening Meter',
          ),
          getField(
            '200.0',
            Colors.black,
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          getText('Closing Meter'),
          getField(
            '0.0',
            Colors.black,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          getField(
            'RTT',
            Colors.black38,
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          getText('Meter Sales(LTRS)'),
          getField('-200.000', Colors.black),
          SizedBox(height: getProportionateScreenHeight(20)),
          getField(
            'Comment',
            Colors.black38,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            'Connected to DG1',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ));
  }

// method to get text header of some fields
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

  @override
  bool get wantKeepAlive => true;
}
