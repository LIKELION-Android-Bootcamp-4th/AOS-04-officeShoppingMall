import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/auth/ui/auth_header.dart';
import 'package:office_shopping_mall/feature/auth/ui/login_form.dart';
import 'package:office_shopping_mall/feature/auth/ui/login_goSignup.dart';

import '../../../core/widgets/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "로그인",
        centerTitle: true, //appTextTheme().headlineLarge
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthHeader(),
                LoginForm(),
                GoSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
