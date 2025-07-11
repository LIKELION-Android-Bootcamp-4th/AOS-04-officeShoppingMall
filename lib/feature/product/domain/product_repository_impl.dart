import 'package:office_shopping_mall/core/data/models/dto/product.dart';

import 'repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {




  @override
  Future<void> addProduct(Product product) async {
    "aoisjdoiasd";
  }

  @override
  Future<List<Product>> fetchProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  }) {
    return fetchProducts();
  }

  @override
  Future<Product> fetchProductDetail(String id) {
    return fetchProductDetail(id);
  }

  @override
  Future<void> updateProduct(Product product) {
    return updateProduct(product);
  }

  @override
  Future<void> deleteProduct(String id) {
    return deleteProduct(id);
  }
}
