import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';

class PwSetting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "비밀번호 변경",),
      body: Column(
        children: [
          Text("하이~~~")
        ],
      ),
    );
  }
}