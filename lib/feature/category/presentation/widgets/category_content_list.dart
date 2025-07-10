import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/category/data/category_section.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../product/presentation/viewmodel/product_list_provider.dart';

class CategoryContentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var section in categorySections) ...[
                InkWell(
                  onTap: () {
                    context.read<ProductListViewModel>().selectCategory(section.title);
                    Navigator.pushNamed(context, AppRoutes.productList);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(backgroundImage: AssetImage(section.image), radius: 20),
                      SizedBox(width: 12),
                      Text(section.title, style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),

                Divider(height: 18, endIndent: 16),

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: section.details.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                      onPressed: () {
                        context.read<ProductListViewModel>().selectCategory("${section.title} / ${section.details[index]}");
                        Navigator.pushNamed(context, AppRoutes.productList);
                      },
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
