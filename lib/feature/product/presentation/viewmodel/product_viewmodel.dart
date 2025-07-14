import 'package:flutter/cupertino.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import '../../domain/repository/product_repository.dart';
import 'package:office_shopping_mall/feature/product/domain/repository/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _repo;

  bool _isLoading = false;
  String? _error;

  ProductViewModel(this._repo);

  Product? selectedProduct;
  String? selectedProductId;
  bool isLoading = true;

  final ProductRepository _repository;

  ProductViewModel(this._repository);

  bool get isLoading => _isLoading;

  String? get error => _error;

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
