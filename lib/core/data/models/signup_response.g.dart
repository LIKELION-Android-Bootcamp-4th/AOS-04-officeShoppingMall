// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      code: json['code'] as String,
      message: json['message'] as String,
      result: SignupResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };

SignupResult _$SignupResultFromJson(Map<String, dynamic> json) => SignupResult(
  userId: json['userId'] as String,
  email: json['email'] as String,
  nickName: json['nickName'] as String,
);

Map<String, dynamic> _$SignupResultToJson(SignupResult instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'nickName': instance.nickName,
    };
