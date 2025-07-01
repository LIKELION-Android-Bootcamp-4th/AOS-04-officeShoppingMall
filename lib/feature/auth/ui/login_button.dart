import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_colors.dart';

class LoginButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "로그인",
            style: TextStyle(color: Color(0xFFFFFFFF),
            fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
    );
  }
}