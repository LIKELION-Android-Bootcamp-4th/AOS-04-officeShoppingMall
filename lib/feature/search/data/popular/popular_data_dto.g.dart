// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularDataDto _$PopularDataDtoFromJson(Map<String, dynamic> json) =>
    PopularDataDto(
      keywords: (json['keywords'] as List<dynamic>)
          .map((e) => PopularKeywordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'],
      options: PopularOptionsDto.fromJson(
        json['options'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PopularDataDtoToJson(PopularDataDto instance) =>
    <String, dynamic>{
      'keywords': instance.keywords,
      'total': instance.total,
      'options': instance.options,
    };
