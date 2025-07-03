import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/product/data/product.dart';
import 'package:office_shopping_mall/feature/product/ui/product_item.dart';


class ProductListContent extends StatefulWidget{
  const ProductListContent({super.key});

  @override
  State<ProductListContent> createState() => _ProductListContent();

}

class _ProductListContent extends State<ProductListContent>{

  int _selectCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {

    var categories = ["td", "asd", "aijdoaisd", "asoijdoiasd", "aosijdoaisdj", "aosijdoaijsdoiasjoid"];

    var products = List<Product>.generate(60, (index) => Product(
      id: index,
      productName: "상품명",
      price: '${10000 + index}원',
      category: 0,
      ),
    );

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
          Container(
            color: Colors.white,
            child: SizedBox(
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
                            color: _selectCategoryIndex == index ? Colors.black : Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
              ),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index){
                return ProductItem(product: filteredProducts[index]);
              },
            ),
          )
        ],
    );
  }
}