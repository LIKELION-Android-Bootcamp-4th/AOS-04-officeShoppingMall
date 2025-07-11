import '../../../../core/data/models/dto/product_dto.dart';

abstract class ProductRepository {
  Future<void> addProduct(ProductDTO product);

  Future<List<ProductDTO>> fetchProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  });

  Future<ProductDTO> fetchProductDetail(String id);

  Future<void> updateProduct(ProductDTO product);

  Future<void> deleteProduct(String id);
}
