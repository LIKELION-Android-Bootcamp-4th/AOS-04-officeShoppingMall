import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/data/models/dto/user_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/setting/domain/setting_address.dart';
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
  late TextEditingController _numberCtrl;
  late TextEditingController _emailCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.user.nickName);
    _numberCtrl = TextEditingController(text: widget.user.phone ?? '');
    _emailCtrl = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    super.dispose();
    _nameCtrl.dispose();
    _numberCtrl.dispose();
    _emailCtrl.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
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
                    Text(widget.user.nickName, style: Theme.of(context).textTheme.titleMedium, ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'images/icon/ic_edit.svg',
                        colorFilter: ColorFilter.mode(
                          appColorScheme().surfaceContainerHigh,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
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
                          controller: _numberCtrl,
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
                      Expanded(
                        child: TextFormField(
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) => !v!.contains('@') ? '이메일 형식이 아닙니다' : null,
                        ),
                      ),
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
                      Text(addr.name, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.fade,),
                      Spacer(),
                      SizedBox(
                        width: 60,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<SettingViewModel>().removeAddress(addr);
                          },
                          style: ElevatedButton.styleFrom(
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
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
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
                  final result = await Navigator.pushNamed(context, AppRoutes.destSetting) as SettingAddress?;
                  if (result != null) { context.read<SettingViewModel>().addAddress(result); }
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
          ],
        ),
      ),
    );
  }
}
