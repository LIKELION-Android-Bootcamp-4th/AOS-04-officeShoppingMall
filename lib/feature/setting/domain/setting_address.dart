class SettingAddress {
  String id;
  String name;
  String addr;
  String phone;
  String recipient;
  bool isDefault = false;

  SettingAddress({
    required this.id,
    required this.name,
    required this.addr,
    required this.phone,
    required this.recipient,
    required this.isDefault,
  });
}
