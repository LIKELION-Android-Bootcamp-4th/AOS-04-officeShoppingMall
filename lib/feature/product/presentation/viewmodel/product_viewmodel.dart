import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/review/presentation/viewmodel/review_model.dart';
import '../../domain/repository/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _repo;

  bool _isLoading = false;
  String? _error;

  ProductViewModel(this._repo);

  Product? selectedProduct;
  String? selectedProductId;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> setSelectedProduct(Product product) async {
    selectedProductId = product.id;
    await getProductById(product.id);
  }

  Future<void> getProductById(String productId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final product = await _repo.fetchProductDetail(productId);
      selectedProduct = product;
    } catch (e) {
      print('Error fetching product: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
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
        selectedProduct = toggled;
        notifyListeners();
      }
    } catch (e) {
      selectedProduct = previous;
      _error = e.toString();
      notifyListeners();
    }
  }
}
