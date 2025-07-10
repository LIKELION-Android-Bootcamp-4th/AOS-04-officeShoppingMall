import 'package:office_shopping_mall/feature/search/data/search_service.dart';
import '../data/popular/popular_data_dto.dart';

class SearchRepository{
  final SearchService _service;

  SearchRepository(this._service);

  Future<PopularDataDto> getPopularKeyword() => _service.fetchPopularKeyword();
}