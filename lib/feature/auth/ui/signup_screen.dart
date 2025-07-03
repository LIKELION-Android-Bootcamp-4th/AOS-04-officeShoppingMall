import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:office_shopping_mall/feature/auth/ui/auth_header.dart';
import 'package:office_shopping_mall/feature/auth/ui/signup_form.dart';

import '../../../core/widgets/custom_app_bar.dart';

class SignupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "회원가입",
          centerTitle: true,
          titleTextStyle: GoogleFonts.notoSans(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            letterSpacing: 0.5
          ),
        ),
        body: Padding(padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
          child:SingleChildScrollView(
            child:  Column(
              children: [
                AuthHeader(),
                SignUpForm(),
              ],
            ),
          ),
        ),
    );
  }
}