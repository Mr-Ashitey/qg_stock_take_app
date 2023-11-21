import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qg_stock_take_app/constants/colors.dart';

class GoodsInTransit extends StatefulWidget {
  const GoodsInTransit({super.key});

  @override
  State<GoodsInTransit> createState() => _GoodsInTransitState();
}

class _GoodsInTransitState extends State<GoodsInTransit>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildSpeedDial(),
      body: const Center(child: Text('Goods in transit')),
    );
  }

  @override
  bool get wantKeepAlive => true;

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22.0),
      backgroundColor: colorYellow,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.edit_outlined, color: Colors.white),
          backgroundColor: colorLightBlue,
          onTap: () {},
          label: 'Manual Discharge',
          labelStyle: TextStyle(color: colorWhite),
          labelBackgroundColor: Colors.grey[700],
        ),
        SpeedDialChild(
          child: const Icon(Icons.qr_code, color: Colors.white),
          backgroundColor: colorLightBlue,
          onTap: () {},
          label: 'Scan QR code',
          labelStyle: TextStyle(color: colorWhite),
          labelBackgroundColor: Colors.grey[700],
        ),
      ],
    );
  }
}
