import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import '../data/product_service.dart';
import 'repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _service;

  ProductRepositoryImpl(this._service);

  @override
  Future<List<Product>> fetchProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  }) async {
    final responses = await _service.getProducts(
      q: q,
      categoryId: categoryId,
      category: category,
      sort: sort,
    );
    return responses.map((response) => Product.fromDTO(response)).toList();
  }

  @override
  Future<Product> fetchProductDetail(String id) async {
    return Product.fromDTO(await _service.getProductDetail(id));
  }
}
