import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/category/data/category_section.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_list_provider.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_item.dart';

class ProductListContent extends StatefulWidget {
  const ProductListContent({super.key});

  @override
  State<ProductListContent> createState() => _ProductListContentState();
}

class _ProductListContentState extends State<ProductListContent> {
  late ProductListViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<ProductListViewModel>();
    vm.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    var categories = null;

    vm = context.watch<ProductListViewModel>();
    final products = vm.products;

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
                  onPressed: () {

                  },
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: vm.category!.contains(categories[index])
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
        if (vm.isLoading)
          const Center(child: CircularProgressIndicator())
        else if (products.isEmpty)
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
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItem(product: product);
            },
          ),
      ],
    );
  }
}
