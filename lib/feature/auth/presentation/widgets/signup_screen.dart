import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/auth_header.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/signup_form.dart';
import 'package:provider/provider.dart';

import '../viewmodel/auth_view_model.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: CustomAppBar(
        title: "회원가입",
        centerTitle: true, //appTextTheme().headlineLarge
      ),
      body: Builder(
        builder: (context) {
          if (viewModel.isLoading) return Center(child: Text("인디케이터 추가하기"));
          if (viewModel.error != null)
            return Center(child: Text("에러뜰때 화면 어케 할지"));
          return Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: SingleChildScrollView(
              child: Column(children: [AuthHeader(), SignUpForm()]),
            ),
          );
        },
      ),
    );
  }
}
