import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';

abstract class ProductRepository {
  // Future<void> addProduct(Product product);

  Future<List<Product>> fetchProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  });

  Future<Product> fetchProductDetail(String id);

  Future<void> updateProduct(ProductDTO product);

  Future<void> updateProductScore(String productId, double score);

  // Future<void> deleteProduct(String id);
}
