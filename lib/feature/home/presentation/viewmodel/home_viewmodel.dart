import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/feature/home/domain/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repo;

  List<ProductDTO> _popularProducts = [];
  bool _isLoading = false;
  String? _error;

  HomeViewModel(this._repo) {
    getPopularProducts(limit: 4);
  }

  List<ProductDTO> get popularProducts => _popularProducts;

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
