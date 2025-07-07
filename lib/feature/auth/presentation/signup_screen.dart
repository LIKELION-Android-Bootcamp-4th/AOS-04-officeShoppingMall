import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/auth_header.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "회원가입",
        centerTitle: true, //appTextTheme().headlineLarge
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: SingleChildScrollView(
          child: Column(children: [AuthHeader(), SignUpForm()]),
        ),
      ),
    );
  }
}
