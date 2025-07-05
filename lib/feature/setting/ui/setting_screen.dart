import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late TextEditingController _nameCtrl;
  late TextEditingController _numberCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _pwCtrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _nameCtrl = TextEditingController(text: '홍길동');
    _numberCtrl = TextEditingController(text: '010-0000-0000');
    _emailCtrl = TextEditingController(text: 'aaa@aaa.com');
    _pwCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _nameCtrl.dispose();
    _numberCtrl.dispose();
    _emailCtrl.dispose();
    _pwCtrl.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '설정'),
      body: Padding(
        padding: EdgeInsets.only(left: 16, top: 10, right: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: appColorScheme().surface,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: appColorScheme().outlineVariant),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorPadding: EdgeInsets.all(2),
                  tabs: [
                    Tab(text: '회원 정보'),
                    Tab(text: '알림 설정'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
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
                          SizedBox(width: 12),
                          Text('data', style: Theme.of(context).textTheme.titleMedium),
                          Spacer(),
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
                  SizedBox(height: 20),
                  Text('회원 정보', style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text('이름', style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _nameCtrl,
                                validator: (v) => v!.isEmpty ? '이름을 입력해주세요.' : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text('전화번호', style: Theme.of(context).textTheme.bodyLarge),
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text('이메일', style: Theme.of(context).textTheme.bodyLarge),
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text('비밀번호', style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _pwCtrl,
                                obscureText: true,
                                validator: (v) => v!.length < 6 ? '6자 이상 입력' : null,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text('비밀번호 변경', style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
