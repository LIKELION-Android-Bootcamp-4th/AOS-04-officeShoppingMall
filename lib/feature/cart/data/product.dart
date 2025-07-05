class Product {
  String productName;
  int productPrice;
  int productNum; //주문번호
  int productDeliveryIndex = 1; //배송 상태. 탭 인덱스 번호와 동일
  Product(this.productName, this.productPrice, this.productNum, this.productDeliveryIndex);
}