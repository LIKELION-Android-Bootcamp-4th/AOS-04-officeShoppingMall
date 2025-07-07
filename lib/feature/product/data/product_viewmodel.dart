import 'package:flutter/cupertino.dart';
import 'package:office_shopping_mall/feature/product/data/product_repository.dart';

import '../../cart/data/product.dart';
import '../domain/i_product_repository.dart';

class ProductDataProvider extends ChangeNotifier {

  final ProductRepository _productRepository = ProductRepositoryImpl();

  Product? _selectedProduct;

  Product? get selectedProduct => _selectedProduct;

  Future<void> setSelectedProduct(String productId) async {
    _selectedProduct = await _productRepository.fetchProductDetail(productId) as Product;
    notifyListeners();
  }

  String? getCategoryInfo(String categoryId) {
    switch (int.parse(categoryId)) {
      case 0:
        return "td / asd";
      case 1:
        return "";
    }
    return null;
  }




}