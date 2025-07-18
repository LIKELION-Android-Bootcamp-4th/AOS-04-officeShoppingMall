import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';

class ProductContentContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final Color? color;

  const ProductContentContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.constraints,
    this.color =  AppColors.gray100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      padding: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      child: child,
    );
  }
}
