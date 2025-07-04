import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/feature/category/data/category_section.dart';

class CategoryContentList extends StatelessWidget {
  // mock category
  final List<CategorySection> _section = <CategorySection>[
    CategorySection('images/icon/ic_close.svg', '데스크테리어', [
      '타공판·보드',
      '받침대·모니터 암',
      '데스크 매트',
      '수납함',
      '마우스 패드',
      '소품',
    ]),
    CategorySection('images/icon/ic_close.svg', '주변기기', ['키보드', '마우스', '스피커', '의자']),
    CategorySection('images/icon/ic_close.svg', '건강보조식품', [
      '정기 배송',
      '루테인',
      '비타민',
      '오메가3',
      '칼슘/미네랄',
    ]),
    CategorySection('images/icon/ic_close.svg', '사무용품', ['용지', '봉투', '잉크', '자석', '사무 소품', '대형 사무']),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var section in _section) ...[
                Row(
                  children: [
                    SvgPicture.asset(section.image),
                    SizedBox(width: 12),
                    Text(section.title, style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),

                Divider(color: Theme.of(context).dividerColor, height: 18, endIndent: 16),

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: section.details.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                      onPressed: () {},
                      child: Text(
                        section.details[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 50,
                  ),
                ),

                SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
