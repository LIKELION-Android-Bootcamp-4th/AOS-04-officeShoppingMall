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
        body: Builder(
            builder: (context) {
              if (viewModel.isLoading) return CustomCircleIndicator();
              // if (viewModel.error != null)
              //   return Center(child: Text("에러뜰때 화면 어케 할지"));
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [AuthHeader(), LoginForm(), GoSignUpButton()],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
}