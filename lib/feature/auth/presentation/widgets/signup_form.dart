import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/auth/presentation/viewmodel/auth_view_model.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
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

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("회원가입"),
          content: const Text("입력하신 정보로 가입을 하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("취소"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("확인"),
            ),
          ],
        ),
      );

      if (confirm == true) {
        final authViewModel = context.read<AuthViewModel>();

        await authViewModel.signUp(
          email: _emailController.text.trim(),
          password: _pwController.text.trim(),
          nickName: _nameController.text.trim(),
        );

        if (mounted) {
          if (authViewModel.error != null) {
            showToast("회원가입 실패: ${authViewModel.error}");
          } else if (authViewModel.signupResponse != null) {
            showToast("회원가입이 완료되었습니다.");
            Navigator.pop(context);
          }
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
    final authViewModel = context.watch<AuthViewModel>();

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
              decoration: buildInputDecoration(label: "이름"),
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
              decoration: buildInputDecoration(
                label: "이메일",
                hint: "예) Walkin@walkin.co.kr",
              ),
              validator: (value) {
                if (_emailController.text.isEmpty) {
                  return "이메일을 입력해주세요.";
                }
                if (!value.toString().isValidEmail()) {
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
              decoration: buildInputDecoration(
                label: "비밀번호",
                suffixIcon: IconButton(
                  onPressed: _changeVisibilityIcon,
                  icon: SvgPicture.asset(
                    _showVisibleIcon
                        ? 'images/icon/ic_invisible.svg'
                        : 'images/icon/ic_visible.svg',
                  ),
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
              decoration: buildInputDecoration(label: "비밀번호 확인"),
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
              child: Text("회원가입"),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration buildInputDecoration({
  required String label,
  String? hint,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    filled: false,
    labelText: label,
    hintText: hint,
    suffixIcon: suffixIcon,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: appTextTheme().bodyMedium,
    floatingLabelStyle: appTextTheme().bodyMedium,
    contentPadding: EdgeInsets.symmetric(vertical: 12),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.gray200, width: 1),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.gray400, width: 1.5),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.red600, width: 1),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: appColorScheme().onError, width: 1.5),
    ),
  );
}

void showToast(String msg) {
  Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT);
}
