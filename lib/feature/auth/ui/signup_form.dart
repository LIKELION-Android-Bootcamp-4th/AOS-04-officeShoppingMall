import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/services/auth_service.dart';

import '../../../core/theme/app_colors.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  //각 입력마다 유효성 검사를 위한 키
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  bool _showVisibleIcon = true;

  void _changeVisibilityIcon() {
    setState(() {
      _showVisibleIcon = !_showVisibleIcon;
    });
  }

  Map<String, String> getFormData() {
    return {
      "nickname": _nameController.text,
      "email": _emailController.text,
      "password": _pwController.text,
    };
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("회원가입"),
          content: Text("입력하신 정보로 가입을 하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("확인"),
            ),
          ],
        ),
      );

      if (confirm == true) {
        final formData = getFormData();
        print("$formData");
        //TODO 회원가입 api

        try{
          final authService = AuthService();
          await authService.signupAction(
              email: formData["email"]!,
              password: formData["password"]!,
              nickname: formData["nickname"]!,);

          showToast("회원가입이 완료되었습니다.");
          return Navigator.pop(context);
        }catch(e){
          showToast(e.toString());
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pwController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _confirmPwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //각 입력마다 유효성 검사를 위한 키
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "이름",
              ),
              validator: (value) {
                if (_nameController.text.isEmpty) {
                  return "이름을 입력해주세요.";
                }
                return null;
              },
            ),

            SizedBox(height: 8),

            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "이메일",
                hintText: "예) Walkin@walkin.co.kr",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              validator: (value) {
                if (_nameController.text.isEmpty) {
                  return "이메일을 입력해주세요.";
                }
                if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value.toString())) {
                  return "이메일은 반드시 aaa@aaa.com 형태여야 합니다.";
                }
                return null;
              },
            ),

            SizedBox(height: 8),

            TextFormField(
              controller: _pwController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: _showVisibleIcon,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "비밀번호",
                suffixIcon: IconButton(
                  onPressed: _changeVisibilityIcon,
                  icon: _showVisibleIcon
                      ? Icon(Icons.visibility_off_outlined)
                      : Icon(Icons.visibility),
                ),
              ),
              validator: (value) {
                if (_pwController.text.isEmpty) {
                  return "비밀번호를 입력해주세요.";
                } else if (_pwController.text.length < 8) {
                  return "비밀번호는 최소 8자 이상이어야 합니다.";
                }
                return null;
              },
            ),

            SizedBox(height: 8),

            TextFormField(
              controller: _confirmPwController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "비밀번호 확인",
              ),
              validator: (value) {
                if (_confirmPwController.text.isEmpty) {
                  return "비밀번호를 입력해주세요.";
                } else if (_pwController.text != _confirmPwController.text) {
                  return "입력한 비밀번호가 다릅니다.";
                } else
                  return null;
              },
            ),

            SizedBox(height: 48),

            ElevatedButton(
              onPressed: () {
                _submitForm();
              },
              child: Text("회원가입", style: TextStyle(color: Colors.white, fontSize: 18)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void showToast(String msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
  );
}