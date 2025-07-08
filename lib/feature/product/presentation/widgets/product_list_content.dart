import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/product/data/product_list_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/ui/product_item.dart';
import 'package:office_shopping_mall/feature/product/data/product.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_item.dart';


class ProductListContent extends StatelessWidget {
  const ProductListContent({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = [
      {"id": "0", "name": "td"},
      {"id": "1", "name": "asd"},
    ];

    final viewModel = context.watch<ProductListProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextButton(
                  onPressed: () => viewModel.selectCategory(index, categories[index]['id']),
                  child: Text(
                    categories[index]['name']!,
                    style: TextStyle(
                      color: viewModel.selectCategoryIndex == index
                          ? Colors.black
                          : Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        if (viewModel.isLoading)
          const Center(child: CircularProgressIndicator())
        else if (viewModel.products.isEmpty)
          const Center(child: Text('상품이 없습니다.'))
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              final product = viewModel.products[index];
              return ProductItem(product: product);
            },
          ),
      ],
    );
  }
}