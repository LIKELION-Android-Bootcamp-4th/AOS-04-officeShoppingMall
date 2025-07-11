import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/home/data/home_category_item.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_list_provider.dart';

class HomeContentCategory extends StatelessWidget {
  const HomeContentCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ProductListViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                vm.selectCategory(categoryItems[index].title);
                Navigator.pushNamed(context, AppRoutes.productList);
              },
              splashFactory: NoSplash.splashFactory,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      categoryItems[index].image,
                      height: 56,
                      width: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(categoryItems[index].title, style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
