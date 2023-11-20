import 'package:flutter/material.dart';

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
      body: Center(child: Text('Goods in transit')),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
