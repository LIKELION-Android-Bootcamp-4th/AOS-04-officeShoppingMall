import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/custom_tab_bar.dart';
import 'package:office_shopping_mall/feature/setting/ui/noti_setting_tab.dart';
import 'package:office_shopping_mall/feature/setting/ui/user_info_tab.dart';

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
      body: Column(
        children: [
          customTabBar(
            controller: _tabController,
            tabs: [
              Tab(text: '회원 정보'),
              Tab(text: '알림 설정'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                UserInfoTab(controller: _tabController),
                NotiSettingTab(controller: _tabController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}