import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/preference/domain/preference_repository.dart';
import '../../domain/repository/product_repository.dart';

class ProductListViewModel extends ChangeNotifier {
  final ProductRepository _repository;
  final PreferenceRepository _preRepo;

  List<Product> products = [];
  bool isLoading = true;
  String? category;
  bool isSearchResult = false;

  ProductListViewModel(this._repository, this._preRepo);

  Future<void> loadProducts({String? category}) async {
    isLoading = true;
    products.clear();
    notifyListeners();

    try {
      if (category != null) {
        final productList = await _repository.fetchProducts(category: category);
        products.addAll(productList);

      }
    } catch (e) {
      print('Error loading products: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  selectCategory(String? categoryName) {
    category = categoryName;
    isSearchResult = false;
    notifyListeners();
  }

  //검색 결과로 불러올 경우를 위함
  void setProductsFromSearch(List<Product> searchResults){
    products = searchResults;
    isLoading = false;
    category = null;
    isSearchResult = true;
    notifyListeners();
  }

  Future<void> toggleFavorite(Product product) async {
    final index = products.indexWhere((p) => p.id == product.id);

    final previous = products[index];

    final toggled = previous.copyWith(isFavorite: !previous.isFavorite);
    products[index] = toggled;
    notifyListeners();

    try {
      final response = await _preRepo.toggleFavorite(product.id);
      Fluttertoast.showToast(msg: response.message);

      if (!response.isLiked) {
        products[index] = toggled;
        notifyListeners();
      }
    } catch (e) {
      products[index] = previous;
      notifyListeners();
    }
  }
}
