import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/services/api_client.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_search.svg')),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_bell.svg')),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_cart.svg')),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // Text("${datas}"),
            // ElevatedButton(onPressed: aasdf, child: Text('데이터 요청'))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
