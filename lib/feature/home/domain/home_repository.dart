import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/home/data/home_service.dart';

class HomeRepository {
  final HomeService _service;

  HomeRepository(this._service);

  Future<List<Product>> fetchProducts({
    int? page,
    int? limit,
    String? category,
    String? search,
    String? sortBy,
  }) async {

    final responses = await _service.getProducts(
      page: page,
      limit: limit,
      category: category,
      search: search,
      sortBy: sortBy,
    );
    return responses.map((response) => Product.fromDTO(response)).toList();
  }
}
