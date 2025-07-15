import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/mypage/domain/mypage_repository.dart';

class MypageViewModel extends ChangeNotifier {
  final MypageRepository _repository;

  User? _user;
  bool _isLoading = false;
  String? _error;
  List<Product> _recentProd = [];

  MypageViewModel(this._repository) {
    getUser();
  }

  User? get user => _user;

  bool get isLoading => _isLoading;

  String? get error => _error;

  List<Product> get recentProd => _recentProd;

  Future<void> getUser() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _repository.getUser();
    } catch (e) {
      _error = '정보 로드 실패: $e';
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadRecentProduct({int? page, int? limit}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _recentProd = await _repository.getRecent(page: page, limit: limit);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(Product product) async {
    final index = _recentProd.indexWhere((favorite) => favorite.id == product.id);

    final previous = _recentProd[index];

    final toggled = previous.copyWith(isFavorite: !previous.isFavorite);
    _recentProd[index] = toggled;
    notifyListeners();

    try {
      final response = await _repository.toggleFavorite(product.id);

      Fluttertoast.showToast(msg: response.message);

      if (!response.isLiked) {
        _recentProd[index] = previous;
        notifyListeners();
      }
    } catch (e) {
      _recentProd[index] = previous;
      _error = e.toString();
      notifyListeners();
    }
  }
}
