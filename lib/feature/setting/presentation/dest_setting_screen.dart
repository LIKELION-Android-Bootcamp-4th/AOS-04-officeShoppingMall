import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_address.dart';

class DestSettingScreen extends StatefulWidget {
  const DestSettingScreen({super.key});

  @override
  State<DestSettingScreen> createState() => _DestSettingScreenState();
}

class _DestSettingScreenState extends State<DestSettingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _recipientCtrl = TextEditingController();
  bool _isDefault = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    _phoneCtrl.dispose();
    _recipientCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '배송지 설정'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // 배송지 이름
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text('배송지 이름', style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _nameCtrl,
                        validator: (v) => (v == null || v.isEmpty) ? '배송지 이름을 입력해주세요.' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 주소
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text('주소', style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _addressCtrl,
                        maxLines: 4,
                        validator: (v) => (v == null || v.isEmpty) ? '주소를 입력해주세요.' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 전화번호
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
                        validator: (v) {
                          if (v == null || v.isEmpty) return '전화번호를 입력해주세요.';
                          final reg = RegExp(r'^\d{2,3}-\d{3,4}-\d{4}$');
                          if (!reg.hasMatch(v)) return '올바른 전화번호 형식이 아닙니다.';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 받는 사람
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text('받는 사람', style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _recipientCtrl,
                        validator: (v) => (v == null || v.isEmpty) ? '받는 사람 이름을 입력해주세요.' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 기본 배송지 설정
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('기본 배송지로 설정'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _isDefault,
                  onChanged: (v) => setState(() => _isDefault = v ?? false),
                ),
              ],
            ),
          ),
        ),
      ),

      // 취소 / 등록 버튼
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: appColorScheme().surfaceContainer),
                child: Text('취소', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  final newAddress = SettingAddress(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: _nameCtrl.text,
                    addr: _addressCtrl.text,
                    phone: _phoneCtrl.text,
                    recipient: _recipientCtrl.text,
                    isDefault: _isDefault,
                  );

                  Navigator.pop(context, newAddress);
                },
                child: const Text('등록'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
