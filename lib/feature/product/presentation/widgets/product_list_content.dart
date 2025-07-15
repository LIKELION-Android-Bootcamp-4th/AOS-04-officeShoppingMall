import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/category/domain/category_section.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_list_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_item.dart';
import '../../../../core/widgets/loading_indicator.dart';

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
    //카테고리를 통해 접근했을 때
    if (vm.category != null) {
      vm.loadProducts(category: vm.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    var categories = categorySections;
    vm = context.watch<ProductListViewModel>();
    final products = vm.products;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //검색 결과가 아닐 때만 카테고리 표시
        if (!vm.isSearchResult) ...[
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(categories[index].title),
                            content: SizedBox(
                              height: 200,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (var category
                                        in categories[index].details)
                                      ListTile(
                                        title: Text(category),
                                        onTap: () {
                                          vm.selectCategory(
                                            "${categories[index].title} / $category",
                                          );
                                          Navigator.pop(context);
                                          vm.loadProducts(
                                            category: vm.category,
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      categories[index].title,
                      style: TextStyle(
                        color:
                            vm.category != null &&
                                vm.category!.contains(categories[index].title)
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
        ],
        if (vm.isSearchResult) const SizedBox(height: 20),

        if (vm.isLoading)
          Center(child: CustomCircleIndicator())
        else if (products.isEmpty)
          Center(child: Text('상품이 없습니다'))
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              childAspectRatio: 0.6,
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
