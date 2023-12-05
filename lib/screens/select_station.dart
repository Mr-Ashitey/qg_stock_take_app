import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:qg_stock_take_app/constants/colors.dart';
import 'package:qg_stock_take_app/constants/size_config.dart';
import 'package:qg_stock_take_app/extensions/snackbar_alert_extension.dart';
import 'package:qg_stock_take_app/offline/prefs_manager.dart';
import 'package:qg_stock_take_app/screens/stock_take_details/stock_take.dart';
import 'package:qg_stock_take_app/util/base_provider.dart';
import 'package:qg_stock_take_app/util/loader_widget.dart';

import '../providers/login_provider.dart';

class SelectStation extends HookWidget {
  const SelectStation({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    Future<void> getStations() async {
      Future.delayed(Duration.zero, () async {
        final result = await context.read<LoginProvider>().getStations();

        result.fold((error) => context.showScaffoldAlert(error), (r) => null);
      });
    }

    useEffect(() {
      getStations();
      return null;
    }
        // TODO: uncomment this line to prevent useEffect from running on every build
        // []
        );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: crossCenter,
              children: [
                SizedBox(height: getProportionateScreenHeight(8)),
                Text(
                  'Select Station',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  PrefsManager().getTeamName(),
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                Flexible(
                  child:
                      Consumer<LoginProvider>(builder: (context, provider, _) {
                    final stations = provider.stations;
                    return LoaderWidget(
                        isLoading:
                            provider.notifierState == NotifierState.loading,
                        child: GridView.builder(
                          itemCount: stations.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // number of items in each row
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 4,
                          ),
                          itemBuilder: (itemBuilder, index) {
                            final station = stations[index];
                            return MaterialButton(
                              onPressed: () async {
                                // Set selected station name and id in shared preferences
                                await PrefsManager()
                                    .setStationName(station.name ?? '');
                                await PrefsManager()
                                    .setStationId(station.id ?? 0);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const StockTakeScreen()));
                              },
                              color: colorGrey,
                              elevation: 0,
                              child: Text(station.name ?? '',
                                  style: TextStyle(color: colorWhite)),
                            );
                          },
                        ));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
