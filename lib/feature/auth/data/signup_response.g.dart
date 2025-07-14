// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: SignupResult.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.result,
    };

SignupResult _$SignupResultFromJson(Map<String, dynamic> json) => SignupResult(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  user: SignupUserDTO.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SignupResultToJson(SignupResult instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

SignupUserDTO _$SignupUserDTOFromJson(Map<String, dynamic> json) =>
    SignupUserDTO(
      id: json['id'] as String,
      userId: json['userId'] as String,
      email: json['email'] as String,
      nickName: json['nickName'] as String,
      platformRoles: (json['platformRoles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isEmailVerified: json['isEmailVerified'] as bool,
      isActive: json['isActive'] as bool,
      needEmailVerification: json['needEmailVerification'] as bool,
      emailVerificationEnabled: json['emailVerificationEnabled'] as bool,
      verificationCodeSent: json['verificationCodeSent'] as bool,
    );

Map<String, dynamic> _$SignupUserDTOToJson(SignupUserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'email': instance.email,
      'nickName': instance.nickName,
      'platformRoles': instance.platformRoles,
      'isEmailVerified': instance.isEmailVerified,
      'isActive': instance.isActive,
      'needEmailVerification': instance.needEmailVerification,
      'emailVerificationEnabled': instance.emailVerificationEnabled,
      'verificationCodeSent': instance.verificationCodeSent,
    };
