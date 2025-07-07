import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ProductContentContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;

  const ProductContentContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      padding: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.gray100),
      child: child,
    );
  }
}
