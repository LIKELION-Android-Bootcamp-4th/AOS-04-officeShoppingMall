enum UserRole { buyer, seller, admin }

class Profile {
  final String? name;
  final DateTime? birthDate;
  final String? profileImage;

  Profile({this.name, this.birthDate, this.profileImage});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'] as String? ?? '',
      birthDate: json['birthDate'] != null ? DateTime.tryParse(json['birthDate'] as String) : null,
      profileImage: json['profileImage'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'birthDate': birthDate?.toIso8601String(),
    'profileImage': profileImage,
  };
}

class UserDTO {
  final String id;
  final String email;
  final String nickName;
  final Profile profile;
  final List<String> loginRoles;
  final List<UserRole> platformRoles;
  final bool isAdmin;
  final bool isActive;
  final bool emailVerified;
  final String companyId;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserDTO({
    required this.id,
    required this.email,
    required this.nickName,
    required this.profile,
    required this.loginRoles,
    required this.platformRoles,
    required this.isAdmin,
    required this.isActive,
    required this.emailVerified,
    required this.companyId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    final loginRoles = (json['loginRoles'] as List<dynamic>?)?.cast<String>() ?? [];
    final platformRoles = <UserRole>[];
    final isAdmin = json['isAdmin'] as bool? ?? false;
    final companyId = json['companyId'] as String? ?? '';

    return UserDTO(
      id: json['id'] as String,
      email: json['email'] as String,
      nickName: json['nickName'] as String? ?? '',
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>? ?? {}),
      loginRoles: loginRoles,
      platformRoles: platformRoles,
      isAdmin: isAdmin,
      isActive: json['isActive'] as bool? ?? false,
      emailVerified: json['emailVerified'] as bool? ?? false,
      companyId: companyId,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'nickName': nickName,
    'profile': profile.toJson(),
    'loginRoles': loginRoles,
    'platformRoles': platformRoles.map((e) => e.name).toList(),
    'isAdmin': isAdmin,
    'isActive': isActive,
    'emailVerified': emailVerified,
    'companyId': companyId,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}
