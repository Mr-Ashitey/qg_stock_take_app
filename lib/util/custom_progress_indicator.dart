import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/constants/colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  final bool isWhite;

  const CustomProgressIndicator({Key? key, this.isWhite = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color color = isWhite ? colorWhite : primaryColor;
    return FittedBox(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Platform.isIOS ? color : null,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
