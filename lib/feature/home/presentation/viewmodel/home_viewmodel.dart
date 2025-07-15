import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/home/domain/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repo;

  List<Product> _popularProducts = [];
  bool _isLoading = false;
  String? _error;

  HomeViewModel(this._repo) {
    getPopularProducts(limit: 4);
  }

  List<Product> get popularProducts => _popularProducts;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> getPopularProducts({int? limit, String? category}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _repo.fetchProducts(
        limit: limit,
        category: category,
        sortBy: 'popular',
      );
      _popularProducts = response;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(Product product) async {
    final index = _popularProducts.indexWhere((favorite) => favorite.id == product.id);

    // 이전 값 백업
    final previous = _popularProducts[index];

    final toggled = previous.copyWith(isFavorite: !previous.isFavorite);
    _popularProducts[index] = toggled;
    notifyListeners();

    try {
      final response = await _repo.toggleFavorite(product.id);

      Fluttertoast.showToast(msg: response.message);

      if (!response.isLiked) {
        _popularProducts[index] = toggled;
        notifyListeners();
      }
    } catch (e) {
      _popularProducts[index] = previous;
      _error = e.toString();
      notifyListeners();
    }
  }
}
