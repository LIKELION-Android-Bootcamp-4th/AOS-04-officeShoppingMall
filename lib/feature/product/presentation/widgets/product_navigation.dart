import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

class ProductNavigation extends StatefulWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const ProductNavigation({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  State<ProductNavigation> createState() => _ProductNavigation();
}

class _ProductNavigation extends State<ProductNavigation> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SizedBox(
        height: 56,
        width: 188,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(widget.tabs.length, (index) {
              final isSelected = selectedIndex == index;

              return TextButton(
                onPressed: () => _handleTabSelected(index),
                style: TextButton.styleFrom(
                  minimumSize: const Size(65, 65),
                  backgroundColor: isSelected
                      ? appColorScheme().tertiary
                      : appColorScheme().surface,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  widget.tabs[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.black : Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
