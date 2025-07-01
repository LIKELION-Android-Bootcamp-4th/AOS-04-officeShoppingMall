import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_colors.dart';

class GoSignInButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      TextButton(
        onPressed: () {}, //회원가입 화면으로 이동
        child: Text(
          "회원가입",
          style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
        ),
      ),
    );
  }
}