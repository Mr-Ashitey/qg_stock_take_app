import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/keyboard.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/extensions/snackbar_alert_extension.dart';
import 'package:qg_stock_take_app/screens/select_station.dart';

import '../providers/login_provider.dart';
import '../util/base_provider.dart';
import '../util/custom_progress_indicator.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNumberCtrl = useTextEditingController();
    final codeCtrl = useTextEditingController();
    final isLoading =
        context.watch<LoginProvider>().notifierState == NotifierState.loading;

    ScreenSize().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: 0, horizontal: MediaQuery.sizeOf(context).width * 0.1),
          child: Column(
            children: [
              TextField(
                maxLength: 10,
                controller: phoneNumberCtrl,
                keyboardType: TextInputType.phone,
                onTapOutside: (event) => hideKeyboard(context),
                decoration: InputDecoration(
                    counterText: "",
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      fontSize: getProportionateScreenHeight(15),
                      color: Colors.black38,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              TextField(
                maxLength: 4,
                controller: codeCtrl,
                keyboardType: TextInputType.phone,
                onTapOutside: (event) => hideKeyboard(context),
                decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Station Code',
                    hintStyle: TextStyle(
                      fontSize: getProportionateScreenHeight(15),
                      color: Colors.black38,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorYellow,
                  fixedSize: Size(MediaQuery.sizeOf(context).width,
                      getProportionateScreenHeight(40)),
                ),
                child: isLoading
                    ? const CustomProgressIndicator()
                    : Text(
                        'LOGIN',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: getProportionateScreenHeight(18),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                onPressed: () async {
                  final phoneNumber = phoneNumberCtrl.text.trim();
                  final code = codeCtrl.text.trim();
                  if (phoneNumber.isEmpty || code.isEmpty) {
                    context.showScaffoldAlert('All fields are required!');
                    return;
                  }

                  final result = await context
                      .read<LoginProvider>()
                      .login(phoneNumber, code);

                  result.fold((error) {
                    context.showScaffoldAlert(error);
                  }, (sucess) {
                    context.showScaffoldAlert("Login Successful",
                        isError: false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectStation()));
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
