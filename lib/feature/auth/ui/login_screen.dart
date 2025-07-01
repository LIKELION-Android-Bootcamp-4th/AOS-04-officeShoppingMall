import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/feature/auth/ui/login_button.dart';
import 'package:office_shopping_mall/feature/auth/ui/login_form.dart';
import 'package:office_shopping_mall/feature/auth/ui/login_goSignin.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("로그인"), centerTitle: true, elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('images/icon/ic_trash.svg',
                width: 48,
                height: 48,
                ),
                Container(
                  width: 150,
                  height: 120,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text("앱 아이콘 위치"),
                ),
                SizedBox(height: 16),

                Text(
                  "직장인을 위한 스마트 쇼핑몰",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 88),

                LoginForm(),

                SizedBox(height: 32),

                LoginButton(),
                GoSignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
