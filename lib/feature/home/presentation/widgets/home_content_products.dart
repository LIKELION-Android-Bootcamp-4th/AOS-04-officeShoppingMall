import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:office_shopping_mall/feature/preference/presentation/viewmodel/preference_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_viewmodel.dart';

class HomeContentProducts extends StatefulWidget {
  final List<Product> products;

  const HomeContentProducts({super.key, required this.products});

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
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final currentProd = widget.products[index];
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
                          ? Image.network(currentProd.thumbnailImage!, fit: BoxFit.fill)
                          : Image.asset('images/banner1.jpg', fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: IconButton(
                      onPressed: () {
                        context.read<HomeViewModel>().toggleFavorite(currentProd);
                        // context.read<PreferenceViewModel>().loadFavorites();
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
              Text(currentProd.name, style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis),
              Text(currentProd.price.toWon, style: Theme.of(context).textTheme.bodyMedium),
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
