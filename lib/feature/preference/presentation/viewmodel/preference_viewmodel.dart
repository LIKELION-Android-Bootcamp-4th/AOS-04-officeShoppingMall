import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/feature/preference/domain/preference_repository.dart';

class PreferenceViewModel extends ChangeNotifier {
  final PreferenceRepository _repo;

  List<ProductDTO> _favorites = [];
  bool _isLoading = false;
  String? _error;

  PreferenceViewModel(this._repo) {
    _getFavorites();
  }

  List<ProductDTO> get favorites => _favorites;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> _getFavorites({String? sort, String? order}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await _repo.fetchPreference(sort: sort, order: order);
      _favorites = response;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
