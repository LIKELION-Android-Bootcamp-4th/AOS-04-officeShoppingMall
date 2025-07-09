import '../../../../core/data/models/dto/product.dart';

abstract class ProductRepository {
  Future<void> addProduct(Product product);

  Future<List<Product>> fetchProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  });

  Future<Product> fetchProductDetail(String id);

  Future<void> updateProduct(Product product);

  Future<void> deleteProduct(String id);
}
