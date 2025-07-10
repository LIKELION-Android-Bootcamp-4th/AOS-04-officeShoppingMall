class SettingAddress {
  String id;
  String name;
  String addr;
  String phone;
  String recipient;
  bool isDefault;

  SettingAddress({
    required this.id,
    required this.name,
    required this.addr,
    required this.phone,
    required this.recipient,
    this.isDefault = false,
  });

  factory SettingAddress.fromJson(Map<String, dynamic> json) {
    return SettingAddress(
      id: json['id'] as String,
      name: json['name'] as String,
      addr: json['addr'] as String,
      phone: json['phone'] as String,
      recipient: json['recipient'] as String,
      isDefault: json['isDefault'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'addr': addr,
      'phone': phone,
      'recipient': recipient,
      'isDefault': isDefault,
    };
  }
}