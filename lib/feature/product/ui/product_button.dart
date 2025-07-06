import 'package:flutter/material.dart';

class ProductButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double height;
  final double? width;
  final double borderRadius;
  final bool isExpanded;
  final int flex;

  const ProductButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.height = 48,
    this.width,
    this.borderRadius = 28,
    this.isExpanded = true,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
    );

    if (isExpanded) {
      return Expanded(flex: flex, child: button);
    } else {
      return button;
    }
  }
}