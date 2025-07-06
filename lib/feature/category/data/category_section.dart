class CategorySection {
  String image;
  String title;
  List<String> details;

  CategorySection(this.image, this.title, this.details);
}

final List<CategorySection> categorySections = <CategorySection>[
  CategorySection('images/category_deskterior.png', '데스크테리어', [
    '타공판·보드',
    '받침대·모니터 암',
    '데스크 매트',
    '수납함',
    '마우스 패드',
    '소품',
  ]),
  CategorySection('images/category_peripheral.png', '주변기기', ['키보드', '마우스', '스피커', '의자']),
  CategorySection('images/category_supplement.png', '건강보조식품', [
    '정기 배송',
    '루테인',
    '비타민',
    '오메가3',
    '칼슘/미네랄',
  ]),
  CategorySection('images/category_office_supplies.png', '사무용품', ['용지', '봉투', '잉크', '자석', '사무 소품', '대형 사무']),
];