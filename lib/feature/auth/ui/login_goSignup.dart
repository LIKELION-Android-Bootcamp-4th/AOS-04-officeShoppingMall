import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_colors.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';

class GoSignUpButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      TextButton(
        onPressed: () {Navigator.pushNamed(context, AppRoutes.signup);}, //회원가입 화면으로 이동
        child: Text(
          "회원가입",
        ),
      ),
    );
  }
}