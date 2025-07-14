import 'package:flutter/cupertino.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';

class ProductViewModel extends ChangeNotifier {
  Product? selectedProduct;

  Future<void> setSelectedProduct(Product product) async {
    selectedProduct = product;
    notifyListeners();
  }
}
