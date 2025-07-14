import 'package:office_shopping_mall/core/data/models/dto/toggle_favorite_response.dart';
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

  // Future<void> updateProduct(Product product);

  // Future<void> deleteProduct(String id);

  Future<ToggleFavoriteResponse> toggleFavorite(String id);
}
