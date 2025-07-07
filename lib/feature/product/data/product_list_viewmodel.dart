import 'package:flutter/cupertino.dart';
import 'package:office_shopping_mall/feature/product/data/models/product.dart';
import 'package:office_shopping_mall/feature/product/data/product_repository.dart';

import '../domain/i_product_repository.dart';

class ProductListProvider extends ChangeNotifier {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  List<Product> _products = [];
  bool _isLoading = true;
  int selectCategoryIndex = 0;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> addProduct() async {
    for (int i = 0; i < products.length; i++) {
      _productRepository.addProduct(products[i]);
    }
  }

  Future<void> loadProducts({String? categoryId}) async {
    _isLoading = true;
    _products = [];
    notifyListeners();

    try {
      final product = await _productRepository.fetchProducts(
        categoryId: categoryId,
      );
      _products = product;
      _isLoading = false;
    }
    catch (e) {
      print('Error loading products: $e');
      _isLoading = false;
    }
    notifyListeners();
  }

  selectCategory(int index, String? categoryId) {
    selectCategoryIndex = index;
    loadProducts(categoryId: categoryId);
  }

  void toggleFavorite(Product product) {
    notifyListeners();
  }

}