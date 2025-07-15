import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/preference/domain/preference_repository.dart';

class PreferenceViewModel extends ChangeNotifier {
  final PreferenceRepository _repo;

  List<Product> _favorites = [];
  int _likeCount = 0;
  bool _isLoading = false;
  String? _error;

  PreferenceViewModel(this._repo) {
    loadFavorites();
  }

  List<Product> get favoritesProd => _favorites;

  int get likeCount => _likeCount;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> loadFavorites({String? sort, String? order}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _favorites = await _repo.fetchPreference(sort: sort, order: order);
      _likeCount = _favorites.length;
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
      final response = await _repo.toggleFavorite(product.id);

      Fluttertoast.showToast(msg: response.message);

      if (!response.isLiked) {
        _favorites[index] = toggled;
        _likeCount = response.likeCount;
        notifyListeners();
      } else {
        _likeCount = response.likeCount;
        // 바뀐 후 값이 좋아요 해제면 해당 상품 삭제
        if (!toggled.isFavorite) _favorites.removeAt(index);
        notifyListeners();
      }
    } catch (e) {
      _favorites[index] = previous;
      _error = e.toString();
      notifyListeners();
    }
  }
}
