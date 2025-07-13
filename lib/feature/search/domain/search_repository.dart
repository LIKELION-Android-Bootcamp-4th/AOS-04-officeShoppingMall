import 'package:office_shopping_mall/feature/search/data/search_service.dart';
import '../../../core/data/models/dto/product_dto.dart';
import '../data/popular/popular_data_dto.dart';

class SearchRepository {
  final SearchService _service;

  SearchRepository(this._service);

  Future<List<ProductDTO>> searchProducts(String query) async {
    try {
      final result = await _service.searchProducts(query);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<PopularDataDto> getPopularKeyword() => _service.fetchPopularKeyword();
}
