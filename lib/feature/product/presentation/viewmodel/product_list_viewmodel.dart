import 'package:flutter/cupertino.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import '../../domain/repository/product_repository.dart';

class ProductListViewModel extends ChangeNotifier {
  final ProductRepository _repository;

  List<Product> products = [];
  bool isLoading = true;
  String? category;

  ProductListViewModel(this._repository);

  Future<void> loadProducts({String? category}) async {
    isLoading = true;
    products.clear();
    notifyListeners();

    try {
      if (category != null) {
        final productList = await _repository.fetchProducts(category: category);
        products.addAll(productList);
      }
    } catch (e) {
      print('Error loading products: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  selectCategory(String categoryName) {
    category = categoryName;
    notifyListeners();
  }

  void toggleFavorite(ProductDTO product) {
    notifyListeners();
  }
}
