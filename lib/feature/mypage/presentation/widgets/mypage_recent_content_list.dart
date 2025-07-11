import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

class MypageRecentContentList extends StatefulWidget {
  const MypageRecentContentList({super.key});

  @override
  State<MypageRecentContentList> createState() => _MypageRecentContentListState();
}

class _MypageRecentContentListState extends State<MypageRecentContentList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 11,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('images/banner1.jpg', fit: BoxFit.fill),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border, color: appColorScheme().onSurface),
                  ),
                ),
              ],
            ),
            Text('상품명', style: Theme.of(context).textTheme.titleMedium),
            Text('100,000원', style: Theme.of(context).textTheme.bodyLarge),
          ],
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
    );
  }
}
