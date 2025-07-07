import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

class HomeContentProducts extends StatefulWidget {
  const HomeContentProducts({super.key});

  @override
  State<HomeContentProducts> createState() => _HomeContentProductsState();
}

class _HomeContentProductsState extends State<HomeContentProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        // 부모 내에서 출력되도록 축소
        shrinkWrap: true,
        // 자체 스크롤 끄기
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                        // TODO 각 위치의 상품으로 이동하도록 변경 필요
                        Navigator.pushNamed(context, AppRoutes.productDetail);
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset('images/banner1.jpg', fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () {
                        // TODO: 하트 변경 이벤트 및 좋아요 이벤트 필요
                      },
                      icon: Icon(Icons.favorite_border, color: appColorScheme().onSurface),
                    ),
                  ),
                ],
              ),
              Text('상품명', style: Theme.of(context).textTheme.titleSmall),
              Text('100,000원', style: Theme.of(context).textTheme.bodyMedium),
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
        ),
      ),
    );
  }
}
