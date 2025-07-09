import 'package:json_annotation/json_annotation.dart';
import 'package:office_shopping_mall/feature/search/data/popular/popular_keyword_dto.dart';
import 'package:office_shopping_mall/feature/search/data/popular/popular_options_dto.dart';

part 'popular_data_dto.g.dart';

// 성공했을 때, data에 담기는 것들(keyword, option, total)
@JsonSerializable()
class PopularDataDto{
  final List<PopularKeywordDto> keywords;
  final total;
  final PopularOptionsDto options;

  PopularDataDto({
    required this.keywords,
    required this.total,
    required this.options
});

  factory PopularDataDto.fromJson(Map<String, dynamic> json) =>
      _$PopularDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PopularDataDtoToJson(this);
}