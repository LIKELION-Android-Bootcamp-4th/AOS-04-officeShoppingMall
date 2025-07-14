// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularResponse _$PopularResponseFromJson(Map<String, dynamic> json) =>
    PopularResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
      data: json['data'] == null
          ? null
          : PopularDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PopularResponseToJson(PopularResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'data': instance.data,
    };
