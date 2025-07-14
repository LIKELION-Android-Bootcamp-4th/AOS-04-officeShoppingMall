import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/viewmodel/mypage_viewmodel.dart';

class MypageRecentContentList extends StatefulWidget {
  const MypageRecentContentList({super.key});

  @override
  State<MypageRecentContentList> createState() => _MypageRecentContentListState();
}

class _MypageRecentContentListState extends State<MypageRecentContentList> {

  @override
  void initState() {
    super.initState();
    context.read<MypageViewModel>().loadRecentProduct();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MypageViewModel>();
    final recentProd = vm.recentProd;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recentProd.length,
      itemBuilder: (context, index) {
        final currentProd = recentProd[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: currentProd.thumbnailImage != null
                      ? Image.network(currentProd.thumbnailImage!.url)
                      : Image.asset('images/banner1.jpg', fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: IconButton(
                    onPressed: () {
                      vm.toggleFavorite(currentProd);
                    },
                    icon: SvgPicture.asset(
                      currentProd.isFavorite
                          ? 'images/icon/ic_heart_small_1.svg'
                          : 'images/icon/ic_heart_small_0.svg',
                    ),
                  ),
                ),
              ],
            ),
            Text(currentProd.name, style: Theme.of(context).textTheme.titleMedium),
            Text(currentProd.price.toWon, style: Theme.of(context).textTheme.bodyLarge),
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
