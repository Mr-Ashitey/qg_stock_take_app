import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/screens/login.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'PFBeauSansPro',
          useMaterial3: false,
          tabBarTheme: TabBarTheme(
            labelColor: colorYellow,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
            labelPadding: const EdgeInsets.all(15),
            indicatorColor: colorYellow,
            unselectedLabelColor: colorWhite,
          )),
      home: const LoginScreen(),
    );
  }
}
