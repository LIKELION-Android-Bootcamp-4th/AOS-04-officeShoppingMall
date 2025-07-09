import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/custom_tab_bar.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/setting/presentation/viewmodel/setting_viewmodel.dart';
import 'package:office_shopping_mall/feature/setting/presentation/widgets/noti_setting_tab.dart';
import 'package:office_shopping_mall/feature/setting/presentation/widgets/user_info_tab.dart';
import 'package:provider/provider.dart';

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
    final vm = context.watch<SettingViewModel>();
    if (vm.isLoading) return CustomCircleIndicator();
    if (vm.error != null) print(vm.error);
    // if (vm.user == null) return Center(child: Text('사용자 정보를 불러올 수 없습니다'));

    final user = vm.user!;
    return Scaffold(
      appBar: CustomAppBar(title: '설정'),
      body: Builder(
        builder: (context) {

          return Column(
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
                    UserInfoTab(controller: _tabController, user: user),
                    NotiSettingTab(controller: _tabController),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
