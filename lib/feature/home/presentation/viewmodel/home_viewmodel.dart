import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/home/domain/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repo;

  List<Product> _popularProducts = [];
  List<Product> _favorites = [];
  bool _isLoading = false;
  String? _error;

  HomeViewModel(this._repo) {
    getPopularProducts(limit: 4);
  }

  List<Product> get popularProducts => _popularProducts;

  List<Product> get favorites => _favorites;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> getPopularProducts({
    int? limit,
    String? category,
  }) async {
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
}
