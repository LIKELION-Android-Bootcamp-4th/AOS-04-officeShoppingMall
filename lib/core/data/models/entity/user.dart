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
      phone: phone,
      address: address,
    );
  }

  User copyWith({
    required String? name,
    required String? phone,
    String? addr,
  }) {
    return User(
      id: id,
      email: email,
      nickName: nickName,
      isAdmin: isAdmin,
      phone: phone ?? this.phone,
      profile: Profile(
        name: name ?? profile.name,
        profileImage: profile.profileImage,
      ),
      address: Address(
        zipCode: address?.zipCode ?? '',
        address1: addr ?? address?.address1 ?? '',
        address2: address?.address2 ?? '',
      ),
    );
  }
}
