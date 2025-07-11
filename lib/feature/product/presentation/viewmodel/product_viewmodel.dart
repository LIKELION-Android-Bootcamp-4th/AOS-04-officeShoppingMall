import 'package:flutter/cupertino.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';

class ProductDataViewModel extends ChangeNotifier {
  ProductDTO? selectedProduct;

  Future<void> setSelectedProduct(ProductDTO product) async {
    selectedProduct = product;
    notifyListeners();
  }
}
