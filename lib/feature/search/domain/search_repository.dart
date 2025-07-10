import 'package:office_shopping_mall/feature/search/data/search_service.dart';
import '../../../core/data/models/dto/product.dart';
import '../data/popular/popular_data_dto.dart';

class SearchRepository {
  final SearchService _service;

  SearchRepository(this._service);

  Future<List<Product>> searchProducts(String query) async {
    return await _service.searchProducts(query);
  }

  Future<PopularDataDto> getPopularKeyword() => _service.fetchPopularKeyword();
}
