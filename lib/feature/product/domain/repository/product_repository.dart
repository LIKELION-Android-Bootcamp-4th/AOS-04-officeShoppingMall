import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/dto/toggle_favorite_response.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  });

  Future<Product> fetchProductDetail(String id);

  Future<void> updateProduct(ProductDTO product);

  Future<void> updateProductScore(String productId, double score);

  Future<ToggleFavoriteResponse> toggleFavorite(String id);
}
