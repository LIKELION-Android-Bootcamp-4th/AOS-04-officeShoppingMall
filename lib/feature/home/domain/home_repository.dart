import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/feature/home/data/home_service.dart';

class HomeRepository {
  final HomeService _service;

  HomeRepository(this._service);

  Future<List<ProductDTO>> fetchProducts({
    int? page,
    int? limit,
    String? category,
    String? search,
    String? sortBy,
  }) async {
    return await _service.getProducts(
      page: page,
      limit: limit,
      category: category,
      search: search,
      sortBy: sortBy,
    );
  }
}
