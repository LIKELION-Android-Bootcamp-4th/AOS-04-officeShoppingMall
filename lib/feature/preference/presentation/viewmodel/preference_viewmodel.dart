import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/preference/domain/preference_repository.dart';

class PreferenceViewModel extends ChangeNotifier {
  final PreferenceRepository _repo;

  List<Product> _favorites = [];
  bool _isLoading = false;
  String? _error;

  PreferenceViewModel(this._repo) {
    _loadFavorites();
  }

  List<Product> get favorites => _favorites;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> _loadFavorites({String? sort, String? order}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final favorites = await _repo.fetchPreference(sort: sort, order: order);
      _favorites = favorites;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(Product product) async {
    final index = _favorites.indexWhere((favorite) => favorite.id == product.id);

    // 이전 값 백업
    final previous = _favorites[index];

    final toggled = previous.copyWith(isFavorite: !previous.isFavorite);
    _favorites[index] = toggled;
    notifyListeners();

    try {
      final success = await _repo.toggleFavorite(product.id);
      if (!success) {
        _favorites[index] = previous;
        notifyListeners();
      } else {
        // 바뀐 후 값이 좋아요 해제면 해당 상품 삭제
        if (!toggled.isFavorite) {
          _favorites.removeAt(index);
          notifyListeners();
        }
      }
    } catch (e) {
      _favorites[index] = previous;
      _error = e.toString();
      notifyListeners();
    }
  }
}
