import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme.dart';
import '../viewmodel/setting_view_model.dart';

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

  void _changeAction() async{
    if(_formKey.currentState!.validate()){
      final viewModel = context.read<SettingViewModel>();
      await viewModel.settingPassword(
        currentPassword: _currentPwController.text,
        newPassword: _pwController.text,
        confirmPassword: _confirmPwController.text,
      );
    }
  }

  void _showResult(){
    final viewModel = Provider.of<SettingViewModel>(context, listen: false);

    if(viewModel.error != null){
      showToast(viewModel.error!);
    } else if (viewModel.passwordChangeResponse != null){
      final response = viewModel.passwordChangeResponse!;

      if(response.success){
        showToast("비밀번호가 성공적으로 변경되었습니다.");
      }else{
        if(response.error != null && response.error!.type != null){
          if(response.error!.type == "VALIDATION_ERROR" || response.error!.type == "BAD_REQUEST"){
            // 오류코드가 400일 때
            showToast("현재 비밀번호를 다시 확인해주세요");
          }else{
            //그 외의 오류 코드들에 대한 토스트
            showToast("오류가 발생하였습니다. ${response.message}");
          }
        }else{
          showToast("오류가 발생하였습니다. ${response.message}");
        }
      }
    }
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
    final viewModel = context.watch<SettingViewModel>();
    return Scaffold(
      appBar: CustomAppBar(title: "비밀번호 변경"),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ElevatedButton(
          onPressed: () { viewModel.isLoading ? null : _changeAction },
          child: viewModel.isLoading ?
          CustomCircleIndicator() : Text("변경"),
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
                      return "새 비밀번호를 입력해주세요.";
                    } else if (_pwController.text.length < 8) {
                      return "새 비밀번호는 최소 8자 이상이어야 합니다.";
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


}


