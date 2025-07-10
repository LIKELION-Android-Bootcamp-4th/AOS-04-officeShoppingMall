import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_address.dart';
import 'package:office_shopping_mall/feature/setting/presentation/viewmodel/setting_viewmodel.dart';

class UserInfoTab extends StatefulWidget {
  final User user;

  UserInfoTab({super.key, required this.controller, required this.user});

  TabController controller;

  @override
  State<UserInfoTab> createState() => _UserInfoTabState();
}

class _UserInfoTabState extends State<UserInfoTab> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _phoneCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.user.nickName);
    _phoneCtrl = TextEditingController(text: widget.user.phone ?? '');
  }

  @override
  void dispose() {
    super.dispose();
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;
    await context.read<SettingViewModel>().updateProfile(
      _nameCtrl.text,
      _phoneCtrl.text,
      widget.user.address,
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SettingViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: appColorScheme().surfaceContainerLow,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: appColorScheme().surfaceContainerHigh,
                      radius: 32,
                    ),
                    const SizedBox(width: 12),
                    Text(widget.user.nickName, style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: SvgPicture.asset(
                    //     'images/icon/ic_edit.svg',
                    //     colorFilter: ColorFilter.mode(
                    //       appColorScheme().surfaceContainerHigh,
                    //       BlendMode.srcIn,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('회원 정보', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text('이름', style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _nameCtrl,
                          validator: (v) => v!.isEmpty ? '이름을 입력해주세요.' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text('전화번호', style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneCtrl,
                          keyboardType: TextInputType.phone,
                          validator: (v) => v!.length < 9 ? '유효한 번호를 입력' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text('이메일', style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      Expanded(child: TextFormField(readOnly: true)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.pwSetting);
                      },
                      child: Text('비밀번호 변경', style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                ],
              ),
            ),
            Text('배송지 설정', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 10),

            for (final addr in vm.addresses)
              Card(
                color: appColorScheme().surfaceContainerLow,
                elevation: 0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        addr.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(width: 16),
                      if (addr.isDefault)
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: appColorScheme().tertiary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text('기본 배송지', style: Theme.of(context).textTheme.labelMedium),
                        ),
                      Spacer(),
                      SizedBox(
                        width: 60,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<SettingViewModel>().removeAddress(addr);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: appColorScheme().surfaceContainer,
                            foregroundColor: appColorScheme().onBackground,
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                          ),
                          child: Text('삭제'),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 60,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.destSetting, arguments: addr);
                          },
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero, elevation: 0),
                          child: Text('수정'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // 배송지 추가 카드
            Card(
              color: appColorScheme().surfaceContainerLow,
              elevation: 0,
              child: InkWell(
                onTap: () async {
                  final result =
                      await Navigator.pushNamed(context, AppRoutes.destSetting) as SettingAddress?;
                  if (result != null) {
                    context.read<SettingViewModel>().addAddress(result);
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: SvgPicture.asset(
                    'images/icon/ic_circle_add.svg',
                    colorFilter: ColorFilter.mode(appColorScheme().onSurface, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _onSave();
              },
              child: Text('저장하기'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
