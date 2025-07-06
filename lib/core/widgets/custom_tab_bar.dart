import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

Widget customTabBar({
  required TabController controller,
  required List<Widget> tabs,
  ValueChanged<int>? onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: tabs.length < 3 ? 80 : 0, vertical: 10),
    child: Container(
      height: 56,
      decoration: BoxDecoration(
        color: appColorScheme().surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: appColorScheme().outlineVariant),
      ),
      child: TabBar(
        controller: controller,
        indicatorPadding: EdgeInsets.all(2),
        tabs: tabs,
        onTap: (index) {
          controller.animateTo(index);
          if (onTap != null) onTap(index);
        },
      ),
    ),
  );
}
