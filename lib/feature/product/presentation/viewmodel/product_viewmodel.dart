import 'package:flutter/cupertino.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import '../../domain/repository/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  Product? selectedProduct;
  String? selectedProductId;
  bool isLoading = true;

  final ProductRepository _repository;

  ProductViewModel(this._repository);

  Future<void> setSelectedProduct(Product product) async {
    selectedProductId = product.id;
    await getProductById(product.id);
  }

  Future<void> getProductById(String productId) async {
    isLoading = true;
    notifyListeners();
    try {
      final product = await _repository.fetchProductDetail(productId);
      selectedProduct = product;
    } catch (e) {
      print('Error fetching product: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}