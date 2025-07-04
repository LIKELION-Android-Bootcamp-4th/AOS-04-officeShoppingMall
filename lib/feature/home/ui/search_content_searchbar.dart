import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

class SearchContentSearchBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        backgroundColor: appColorScheme().surface,
        body: Material(
          elevation: 1,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                //TODO: 앱바 테마와 맞추기
                height: 56,
                child: Row(
                  children: [
                    IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8, // 화면 너비의 80%
                      height: 40,
                      child: Expanded(
                        child: SearchBar(
                          trailing: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                          ],
                          // TODO: 백그라운드 색 지정
                          backgroundColor: WidgetStateProperty.all(AppColors.gray400),
                          elevation: WidgetStateProperty.all(0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}