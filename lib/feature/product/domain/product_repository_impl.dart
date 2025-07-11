import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import '../data/product_service.dart';
import 'repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

  final ProductService _service;

  ProductRepositoryImpl(this._service);

  @override
  Future<void> addProduct(ProductDTO product) {
    return _service.createProduct(product);
  }

  @override
  Future<List<ProductDTO>> fetchProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  }) {
    return _service.getProducts(
      q: q,
      categoryId: categoryId,
      category: category,
      sort: sort,
    );
  }

  @override
  Future<ProductDTO> fetchProductDetail(String id) {
    return _service.getProductDetail(id);
  }

  @override
  Future<void> updateProduct(ProductDTO product) {
    return _service.updateProduct(product);
  }

  @override
  Future<void> deleteProduct(String id) {
    return _service.deleteProduct(id);
  }
}
