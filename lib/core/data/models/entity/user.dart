import 'package:office_shopping_mall/core/data/models/dto/user_dto.dart';

class User {
  final String id;
  final String email;
  final String nickName;
  final bool isAdmin;
  final String? phone;
  final Profile profile;
  final Address? address;

  User({
    required this.id,
    required this.email,
    required this.nickName,
    required this.isAdmin,
    required this.phone,
    required this.profile,
    required this.address,
  });

  factory User.fromDTO(UserDTO dto) {
    return User(
      id: dto.id,
      email: dto.email,
      nickName: dto.nickName,
      isAdmin: dto.isAdmin,
      profile: dto.profile,
      phone: dto.phone,
      address: dto.address,
    );
  }

  UserDTO toDTO() {
    return UserDTO(
      id: id,
      email: email,
      nickName: nickName,
      isAdmin: isAdmin,
      profile: profile,
      createdAt: DateTime.now(),
      phone: phone,
      address: address,
    );
  }

  User copyWith({
    String? nickName,
    String? phone,
    Address? address,
  }) {
    return User(
      id: id,
      email: email,
      // TODO: 서버 롤백으로 500 에러 유지 중. 변경 후 name을 받는다면 바꾸기
      nickName: nickName ?? this.nickName,
      isAdmin: isAdmin,
      phone: phone ?? this.phone,
      profile: profile,
      address: address ?? this.address,
    );
  }
}
