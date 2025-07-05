import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '설정'),
      body: Padding(
        padding: EdgeInsets.only(left: 16, top: 10, right: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: appColorScheme().surface,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: appColorScheme().outlineVariant),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorPadding: EdgeInsets.all(2),
                  tabs: [
                    Tab(text: '회원 정보'),
                    Tab(text: '알림 설정'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(),
            ),
          ],
        ),
      ),
    );
  }
}
