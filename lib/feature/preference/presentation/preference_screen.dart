import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/preference/presentation/viewmodel/preference_viewmodel.dart';
import 'package:office_shopping_mall/feature/preference/presentation/widgets/preference_content_count_text.dart';
import 'package:office_shopping_mall/feature/preference/presentation/widgets/preference_content_list.dart';
import 'package:provider/provider.dart';

class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PreferenceViewModel>();

    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: '좋아요', isLeading: false, actions: appBarActionsDefault()),
      body: Builder(
        builder: (context) {
          if (vm.isLoading) return const Center(child: CircularProgressIndicator());
          if (vm.error != null) return Center(child: Text('에러: ${vm.error}'));

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    PreferenceContentCountText(),
                    SizedBox(height: 8),
                    PreferenceContentList(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
