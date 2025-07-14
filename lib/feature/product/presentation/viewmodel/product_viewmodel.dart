import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/product/domain/repository/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _repo;

  bool _isLoading = false;
  String? _error;

  ProductViewModel(this._repo);

  Product? selectedProduct;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> setSelectedProduct(Product product) async {
    selectedProduct = product;
    notifyListeners();
  }

  Future<void> toggleFavorite(Product product) async {
    final previous = selectedProduct;

    final toggled = previous?.copyWith(isFavorite: !previous.isFavorite);
    selectedProduct = toggled;
    notifyListeners();

    try {
      final response = await _repo.toggleFavorite(product.id);

      Fluttertoast.showToast(msg: response.message);

      if (!response.isLiked) {
        selectedProduct = previous;
        notifyListeners();
      }
    } catch (e) {
      selectedProduct = previous;
      _error = e.toString();
      notifyListeners();
    }
  }
}
