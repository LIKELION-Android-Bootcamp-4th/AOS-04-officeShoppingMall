import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/auth_header.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/signup_form.dart';
import 'package:provider/provider.dart';

import 'viewmodel/auth_view_model.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: CustomAppBar(
        title: "회원가입",
        centerTitle: true, //appTextTheme().headlineLarge
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: SingleChildScrollView(
              child: Column(children: [AuthHeader(), SignUpForm()]),
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
