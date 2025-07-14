import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/preference/presentation/viewmodel/preference_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class PreferenceContentList extends StatelessWidget {
  const PreferenceContentList({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PreferenceViewModel>();
    final favorites = context.select((PreferenceViewModel vm) => vm.favoritesProd);

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
                InkWell(
                  onTap: () {
                    context.read<ProductViewModel>().setSelectedProduct(currentProd);
                    Navigator.pushNamed(context, AppRoutes.productDetail);
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: currentProd.thumbnailImage != null
                        ? Image.network(currentProd.thumbnailImage!)
                        : Image.asset('images/banner1.jpg', fit: BoxFit.fill),
                  ),
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
            Text(currentProd.name, style: Theme.of(context).textTheme.bodyLarge),
            Text(currentProd.price.toWon, style: Theme.of(context).textTheme.bodyMedium),
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
