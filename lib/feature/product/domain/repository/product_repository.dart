import 'package:office_shopping_mall/core/data/models/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  });

  Future<Product> fetchProductDetail(String id);
}
