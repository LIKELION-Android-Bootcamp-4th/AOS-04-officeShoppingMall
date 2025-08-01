import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/search/domain/search_repository.dart';
import '../../data/popular/popular_data_dto.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _repository;

  PopularDataDto? popularDataDto;
  bool isLoading = false;
  String? error;
  List<Product> searchResult = [];

  SearchViewModel(this._repository);

  Future<void> searchProducts(String query) async {
    print('SearchViewModel.searchProducts 호출: $query');
    isLoading = true;
    error = null;
    searchResult = [];
    notifyListeners();

    try {
      final result = await _repository.searchProducts(query);
      searchResult = result;
    } catch (e) {
      error = "상품 검색 실패 $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPopularKeywords() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      popularDataDto = await _repository.getPopularKeyword();
    } catch (e) {
      error = "인기 검색어 로드 실패 $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
