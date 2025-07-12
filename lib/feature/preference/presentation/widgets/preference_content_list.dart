import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/preference/presentation/viewmodel/preference_viewmodel.dart';

class PreferenceContentList extends StatefulWidget {
  const PreferenceContentList({super.key});

  @override
  State<PreferenceContentList> createState() => _PreferenceContentListState();
}

class _PreferenceContentListState extends State<PreferenceContentList> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final favorites = context.select((PreferenceViewModel vm) => vm.favorites);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final currentProd = favorites[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  // TODO: 현재 상품 이미지가 없어 임시로 null 가능 적용
                  child: Image.asset(currentProd.thumbnailImage ?? 'images/banner1.jpg', fit: BoxFit.fill),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: IconButton(
                    onPressed: () {
                      isFavorite = currentProd.isFavorite;
                    },
                    icon: SvgPicture.asset(
                      isFavorite
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
