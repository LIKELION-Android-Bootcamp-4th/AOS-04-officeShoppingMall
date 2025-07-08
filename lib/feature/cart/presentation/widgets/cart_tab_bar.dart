import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

Widget CartTabBar({
  required TabController controller,
  required List<Widget> tabs,
  ValueChanged<int>? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    child: Container(
      height: 90,
      decoration: BoxDecoration(
        color: appColorScheme().surface,
        borderRadius: BorderRadius.circular(60),
        border: Border.all(color: appColorScheme().outlineVariant),
      ),
      child: TabBar(
        controller: controller,
        indicatorPadding: EdgeInsets.all(2),
        labelPadding: EdgeInsets.symmetric(vertical: 16),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black54,
        indicator: BoxDecoration(
            color: Color(0x8270AEFF),
            borderRadius: BorderRadius.circular(60)
        ),
        tabs: tabs,
        onTap: (index){
          controller.animateTo(index);
          if (onTap != null) onTap(index);
        },
      ),
    ),
  );
}
