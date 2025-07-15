import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/search/data/search_service.dart';
import '../data/popular/popular_data_dto.dart';

class SearchRepository {
  final SearchService _service;

  SearchRepository(this._service);

  Future<List<Product>> searchProducts(String query) async {
    try {
      final result = await _service.searchProducts(query);
      return result.map((res) => Product.fromDTO(res)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<PopularDataDto> getPopularKeyword() => _service.fetchPopularKeyword();
}
