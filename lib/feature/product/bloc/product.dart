class Product{
  final int id;
  final String productName;
  final String price;
  final String imageUrl;
  final int category;

  Product({required this.id, required this.productName, required this.price, this.imageUrl = '', required this.category});
}