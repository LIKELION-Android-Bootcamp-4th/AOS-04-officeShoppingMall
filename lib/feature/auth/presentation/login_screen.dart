import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/auth_header.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/login_form.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/login_goSignup.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_bar/custom_app_bar.dart';
import '../../../core/widgets/loading_indicator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: CustomAppBar(
        title: "로그인",
        centerTitle: true, //appTextTheme().headlineLarge
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AuthHeader(), LoginForm(), GoSignUpButton()],
                ),
              ),
            ),
          ),
          if (viewModel.isLoading)
            Container(
              color: Colors.black54, //배경 살짝 어두워진 상태로 인디케이터 돌아가게
              child: Center(child: CustomCircleIndicator()),
            ),
        ],
      ),
    );
  }
}
