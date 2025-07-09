import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/custom_tab_bar.dart';
import 'package:office_shopping_mall/feature/review/presentation/widgets/review_writable_tab.dart';
import 'package:office_shopping_mall/feature/review/presentation/widgets/review_written_tab.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>
    with SingleTickerProviderStateMixin {
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
      appBar: CustomAppBar(title: '리뷰'),
      body: Column(
        children: [
          customTabBar(
            controller: _tabController,
            tabs: [
              Tab(text: '작성 가능'),
              Tab(text: '작성 완료'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ReviewWritableTab(),
                ReviewWrittenTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
