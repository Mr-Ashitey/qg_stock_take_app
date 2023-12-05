import 'package:flutter/material.dart';
import 'package:qg_stock_take_app/util/custom_progress_indicator.dart';

class LoaderWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoaderWidget({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CustomProgressIndicator(isWhite: false));
    }
    return child;
  }
}
