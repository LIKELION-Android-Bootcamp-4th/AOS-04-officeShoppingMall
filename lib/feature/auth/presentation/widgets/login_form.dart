import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/auth/data/auth_service.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

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
    final email = _emailController.text;
    final pw = _pwController.text;

    if (email.isEmpty || pw.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("이메일과 비밀번호를 입력해주세요")));
      return;
    }

    try {
      final authService = AuthService();
      final accessToken = await authService.loginAction(
        email: email,
        password: pw,
      );
      print('로그인 성공! 액세스 토큰: $accessToken');

      // final auth = Provider.of<AuthViewModel>(context, listen: false);
      // auth.login();

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    } catch (e) {
      final error = e.toString();
      if (error.contains("401")) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("이메일 또는 비밀번호가 올바르지 않습니다")));
        return;
      }
      print('로그인 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
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
    );
  }
}
