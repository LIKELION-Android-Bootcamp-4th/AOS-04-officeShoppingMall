import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
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
  ImagePicker picker = ImagePicker();
  String? addr;
  String? profileImagePath;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.user.nickName);
    _phoneCtrl = TextEditingController(text: widget.user.phone ?? '');
    profileImagePath = null;
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
      name: _nameCtrl.text,
      phone: _phoneCtrl.text,
      addr: addr,
      profileImagePath: profileImagePath,
    );
    setState(() {
      profileImagePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SettingViewModel>();
    final serverUrl = vm.uploadImageUrl ?? vm.user?.profile.profileImage;
    ImageProvider? imageProvider;

    if (profileImagePath != null) {
      imageProvider = FileImage(File(profileImagePath!));
    } else if (serverUrl != null && serverUrl.isNotEmpty) {
      imageProvider = NetworkImage(serverUrl);
    }

    return WillPopScope(
      onWillPop: () async {
        await _onSave();
        return true;
      },
      child: Padding(
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
                      InkWell(
                        onTap: showImagePickerDialog,
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: imageProvider,
                          backgroundColor: appColorScheme().surfaceContainerHigh,
                          child: imageProvider == null
                              ? SvgPicture.asset('images/icon/ic_user.svg')
                              : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.user.nickName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: showImagePickerDialog,
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
                          child: Text(
                            '이름',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
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
                          child: Text(
                            '전화번호',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
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
                          child: Text(
                            '이메일',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            initialValue: widget.user.email,
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
                        child: Text(
                          '비밀번호 변경',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('배송지 설정', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 10),

              for (final address in vm.addresses)
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
                          address.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.fade,
                        ),
                        const SizedBox(width: 16),
                        if (address.isDefault)
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: appColorScheme().tertiary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '기본 배송지',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        Spacer(),
                        SizedBox(
                          width: 60,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<SettingViewModel>().removeAddress(address);
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
                              Navigator.pushNamed(
                                context,
                                AppRoutes.destSetting,
                                arguments: address,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              elevation: 0,
                            ),
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
                        await Navigator.pushNamed(context, AppRoutes.destSetting)
                            as SettingAddress?;
                    if (result != null) {
                      context.read<SettingViewModel>().addAddress(result);
                      if (vm.addresses.length == 1) result.isDefault = true;
                      if (result.isDefault) addr = result.addr;
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: SvgPicture.asset(
                      'images/icon/ic_circle_add.svg',
                      colorFilter: ColorFilter.mode(
                        appColorScheme().onSurface,
                        BlendMode.srcIn,
                      ),
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
      ),
    );
  }

  void showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('프로필 사진 선택'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('카메라로 촬영'),
                onTap: () {
                  Navigator.pop(context); // dialog close
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('갤러리에서 선택'),
                onTap: () {
                  Navigator.pop(context); // dialog close
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          profileImagePath = image.path;
        });
      }
      _onSave();
    } catch (e) {
      print(e);
    }
  }
}
