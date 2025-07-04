class Product{
  final int id;
  final String productName;
  final String price;
  final String description;
  final List<String>? imageUrl;
  final int category;
  final Map<String, String>? categoryInfo;

  Product({required this.id, required this.productName, required this.price, this.description = '', this.imageUrl, required this.category, this.categoryInfo});
}

int _selectProductIndex = 0;


