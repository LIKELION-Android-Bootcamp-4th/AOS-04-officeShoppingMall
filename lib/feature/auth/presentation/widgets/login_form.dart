import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:office_shopping_mall/feature/auth/presentation/widgets/signup_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  bool _showClearIcon = false;
  bool _showVisibleIcon = true;

  void _changeVisibilityIcon() {
    setState(() {
      _showVisibleIcon = !_showVisibleIcon;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _showClearIcon = _emailController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwController.dispose();
  }

  void loginAction() async {
    final email = _emailController.text.trim();
    final pw = _pwController.text.trim();
    final authViewModel = context.read<AuthViewModel>();

    if (email.isEmpty || pw.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppConst.err.inputId)));
      return;
    }

    await authViewModel.logIn(email: email, password: pw);
    final String? error = authViewModel.error;
    if (error != null) {
      if (error.contains("인증 실패")) {
        showToast("로그인 실패");
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(AppConst.err.checkUpInput)));
      }
    } else if (authViewModel.loginResponse != null) {
      print('로그인 성공! 액세스 토큰: ${authViewModel.loginResponse!.data.accessToken}');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "이메일",
              suffixIcon: _showClearIcon
                  ? IconButton(
                      onPressed: () {
                        _emailController.clear();
                      },
                      icon: Icon(Icons.clear),
                    )
                  : null,
            ),
          ),

          SizedBox(height: 16),

          TextFormField(
            controller: _pwController,
            obscureText: _showVisibleIcon,
            decoration: InputDecoration(
              hintText: "비밀번호",
              suffixIcon: IconButton(
                onPressed: _changeVisibilityIcon,
                icon: _showVisibleIcon
                    ? SvgPicture.asset('images/icon/ic_invisible.svg')
                    : SvgPicture.asset('images/icon/ic_visible.svg'),
              ),
            ),
          ),

          SizedBox(height: 32),

          ElevatedButton(
            onPressed: () {
              loginAction();
            },
            child: Text("로그인"),
          ),
        ],
      ),
    );
  }
}
