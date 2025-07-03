import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  : SvgPicture.asset(
                'images/icon/ic_visible.svg',
                colorFilter: const ColorFilter.mode(Color(0x80000000), BlendMode.srcIn)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
