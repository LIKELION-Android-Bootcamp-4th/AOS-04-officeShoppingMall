import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/product/data/product.dart';
import 'package:office_shopping_mall/feature/product/ui/product_item.dart';

class ProductListContent extends StatefulWidget {
  const ProductListContent({super.key});

  @override
  State<ProductListContent> createState() => _ProductListContent();
}

class _ProductListContent extends State<ProductListContent> {
  int _selectCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    var categories = [
      "td",
      "asd",
      "aijdoaisd",
      "asoijdoiasd",
      "aosijdoaisdj",
      "aosijdoaijsdoiasjoid",
    ];

    var filteredProducts = products
        .where((product) => product.category == _selectCategoryIndex)
        .toList();

    void selectCategory(int index) {
      setState(() {
        _selectCategoryIndex = index;
      });
    }

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
                    selectCategory(index);
                  },
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: _selectCategoryIndex == index
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

        SizedBox(height: 20),

        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return ProductItem(product: product);
          },
        ),
      ],
    );
  }
}
