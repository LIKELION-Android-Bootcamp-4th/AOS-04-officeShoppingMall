import 'package:flutter/cupertino.dart';
import 'package:office_shopping_mall/core/data/models/dto/product.dart';

class ProductDataViewModel extends ChangeNotifier {
  final _productRepository;

  Product? selectedProduct;

  ProductDataViewModel(this._productRepository);

  Future<void> setSelectedProduct(Product product) async {
    selectedProduct = product;
    notifyListeners();
  }
}
