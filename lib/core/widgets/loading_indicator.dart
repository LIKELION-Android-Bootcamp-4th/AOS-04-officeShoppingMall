import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

class CustomCircleIndicator extends StatefulWidget {
  const CustomCircleIndicator({super.key});

  @override
  State<CustomCircleIndicator> createState() => _CustomCircleIndicatorState();
}

class _CustomCircleIndicatorState extends State<CustomCircleIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60,
        width: 60,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            appColorScheme().primary,
            appColorScheme().primaryContainer,
            appColorScheme().secondary,
          ],
        ),
      ),
    );
  }
}
