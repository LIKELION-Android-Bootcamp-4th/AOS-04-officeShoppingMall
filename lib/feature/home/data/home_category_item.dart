class HomeCategoryItem {
  String image;
  String title;

  HomeCategoryItem({required this.image, required this.title});
}

final List<HomeCategoryItem> categoryItems = <HomeCategoryItem>[
  HomeCategoryItem(image: 'images/category_rect_deskterior.png', title: '데스크테리어'),
  HomeCategoryItem(image: 'images/category_rect_office_supplies.png', title: '사무용품'),
  HomeCategoryItem(image: 'images/category_rect_peripheral.png', title: '주변기기'),
  HomeCategoryItem(image: 'images/category_rect_supplement.jpg', title: '건강보조식품'),
];
