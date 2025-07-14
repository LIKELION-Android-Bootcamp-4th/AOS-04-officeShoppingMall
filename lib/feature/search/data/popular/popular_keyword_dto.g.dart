// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_keyword_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularKeywordDto _$PopularKeywordDtoFromJson(Map<String, dynamic> json) =>
    PopularKeywordDto(
      id: json['id'] as String,
      keyword: json['keyword'] as String,
      count: (json['count'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      lastSearchedAt: json['lastSearchedAt'] as String?,
    );

Map<String, dynamic> _$PopularKeywordDtoToJson(PopularKeywordDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keyword': instance.keyword,
      'count': instance.count,
      'rank': instance.rank,
      'lastSearchedAt': instance.lastSearchedAt,
    };
