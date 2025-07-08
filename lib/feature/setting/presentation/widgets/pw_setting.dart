import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';

import '../../../../core/theme/theme.dart';

class PwSetting extends StatefulWidget {
  const PwSetting({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PwSettingState();
  }
}

class _PwSettingState extends State<PwSetting> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPwController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  bool _showCurrentPwVisible = true;
  bool _showNewPwVisible = true;

  void _toggleCurrentPwVisibility() {
    setState(() {
      _showCurrentPwVisible = !_showCurrentPwVisible;
    });
  }
  void _toggleNewPwVisibility() {
    setState(() {
      _showNewPwVisible = !_showNewPwVisible;
    });
  }

  void showToast(String msg) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT);
  }

  void getNewPw(String newPW) {
    print('새 비밀번호는: $newPW');
    showToast("비밀번호가 변경되었습니다.");
    //TODO: 비밀번호 변경 api 연결
  }

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState?.dispose();
    _pwController.dispose();
    _confirmPwController.dispose();
    _currentPwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "비밀번호 변경"),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              getNewPw(_confirmPwController.text);
            }
          },
          child: Text("변경"),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [

                TextFormField(
                  controller: _currentPwController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: _showCurrentPwVisible,
                  decoration: buildInputDecoration(
                    label: "현재 비밀번호",
                    suffixIcon: IconButton(
                      onPressed: _toggleCurrentPwVisibility,
                      icon: SvgPicture.asset(
                        _showCurrentPwVisible
                            ? 'images/icon/ic_invisible.svg'
                            : 'images/icon/ic_visible.svg',
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (_currentPwController.text.isEmpty) {
                      return "비밀번호를 입력해주세요.";
                    } else if (_currentPwController.text.length < 8) {
                      return "비밀번호는 최소 8자 이상이어야 합니다.";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                TextFormField(
                  controller: _pwController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: _showNewPwVisible,
                  decoration: buildInputDecoration(
                    label: "새 비밀번호",
                    suffixIcon: IconButton(
                      onPressed: _toggleNewPwVisibility,
                      icon: SvgPicture.asset(
                        _showNewPwVisible
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

                SizedBox(height: 16),

                TextFormField(
                  controller: _confirmPwController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: buildInputDecoration(label: "새 비밀번호 확인"),
                  validator: (value) {
                    if (_confirmPwController.text.isEmpty) {
                      return "비밀번호를 입력해주세요.";
                    } else if (_pwController.text !=
                        _confirmPwController.text) {
                      return "입력한 비밀번호가 다릅니다.";
                    } else
                      return null;
                  },
                ),
              ],
            ),
          ),
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
