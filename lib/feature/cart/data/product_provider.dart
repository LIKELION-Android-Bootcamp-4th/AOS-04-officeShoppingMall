import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/cart/data/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [
    Product("장바구니 상품1", 100000, 1111, 0),
    Product("장바구니 상품2", 100000, 2222, 0),
    Product("장바구니 상품3", 100000, 3333, 0),
    Product("장바구니 상품4", 100000, 4444, 0),
    Product("상품명1", 100000, 111111, 1),
    Product("상품명2", 100000, 222222, 1),
    Product("상품명3", 100000, 333333, 1),
    Product("배송중인 상품", 100000, 2222, 2),
    Product("배송완료 상품", 100000, 2222, 3),
  ];

  void deleteProduct(Product product) {
    products.remove(product);
    notifyListeners();
  }
}
