import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/network/dio_client.dart';
import 'package:qg_stock_take_app/offline/prefs_manager.dart';
import 'package:qg_stock_take_app/providers/login_provider.dart';
import 'package:qg_stock_take_app/providers/sales_provider.dart';
import 'package:qg_stock_take_app/screens/login.dart';
import 'package:qg_stock_take_app/offline/database_helper.dart';
import 'package:qg_stock_take_app/screens/select_station.dart';

import 'constants/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioClient().initDioClient();
  await DatabaseHelper().initDatabase();
  await PrefsManager().init();
  // PrefsManager().clearPrefs();

  runApp(const StockTakeApp());
}

class StockTakeApp extends StatelessWidget {
  const StockTakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginProvider()),
        ChangeNotifierProvider.value(value: SalesProvider()),
      ],
      child: MaterialApp(
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
        home: PrefsManager().isLoggedIn()
            ? const SelectStation()
            : const LoginScreen(),
      ),
    );
  }
}
