import 'package:flutter/material.dart';

extension ScaffoldAlert on BuildContext {
  void showScaffoldAlert(String message, {bool isError = true}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : const Color(0xFF00B112),
      ));
  }
}

void hideSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}
