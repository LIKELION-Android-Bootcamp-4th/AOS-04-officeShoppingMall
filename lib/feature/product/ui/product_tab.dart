import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';

class ProductTab extends StatefulWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const ProductTab({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  State<ProductTab> createState() => _ProductTab();
}

class _ProductTab extends State<ProductTab> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  void _handleTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray200),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.tabs.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => _handleTabSelected(index),
            child: AnimatedContainer(
              height: 56,
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.secondaryContainerColor : Colors.transparent,
                borderRadius: BorderRadius.circular(60),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.tabs[index],
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
              ),
            ),
          );
        }),
      ),
    );
  }
}
