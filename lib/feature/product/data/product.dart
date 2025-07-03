class Product{
  final int id;
  final String productName;
  final String price;
  final String description;
  final String imageUrl;
  final int category;

  Product({required this.id, required this.productName, required this.price, this.description = '', this.imageUrl = '', required this.category});
}