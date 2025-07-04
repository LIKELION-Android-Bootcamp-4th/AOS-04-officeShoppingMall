class Product{
  final int id;
  final String productName;
  final int price;
  final String? description;
  final List<String>? imageUrl;
  final int category;
  final Map<String, String>? categoryInfo;

  Product({required this.id, required this.productName, required this.price, this.description, this.imageUrl, required this.category, this.categoryInfo});
}

int? _selectProductId;

void setSelectProductId(int? productId) {
  _selectProductId = productId;
}

int? getSelectProductId() => _selectProductId;

var products = List<Product>.generate(60, (index) => Product(
  id: index,
  productName: "상품명",
  price: 10000 + index,
  category: 0,
),
);


