class Product {
  final int id;
  final String productName;
  final int price;
  final String? description;
  final List<String>? imageUrl;
  bool isFavorite;
  final int category;
  final Map<String, String>? categoryInfo;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    this.description,
    this.imageUrl,
    this.isFavorite = false,
    required this.category,
    this.categoryInfo,
  });
}

int? _selectProductId;

void setSelectProductId(int? productId) {
  _selectProductId = productId;
}

int? getSelectProductId() => _selectProductId;

Product? getSelectedProductData() {
  final id = getSelectProductId();
  if (id == null) return null;

  try {
    return products.firstWhere((element) => element.id == id);
  } catch (e) {
    return null;
  }
}

var products = List<Product>.generate(
  60,
  (index) => Product(
    id: index,
    productName: "상품명",
    price: 10000 + index,
    category: 0,
    categoryInfo: {"td": "asd"},
  ),
);
