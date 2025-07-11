// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_options_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularOptionsDto _$PopularOptionsDtoFromJson(Map<String, dynamic> json) =>
    PopularOptionsDto(
      limit: (json['limit'] as num).toInt(),
      timeRange: json['timeRange'] as String?,
      minCount: (json['minCount'] as num).toInt(),
    );

Map<String, dynamic> _$PopularOptionsDtoToJson(PopularOptionsDto instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'timeRange': instance.timeRange,
      'minCount': instance.minCount,
    };
