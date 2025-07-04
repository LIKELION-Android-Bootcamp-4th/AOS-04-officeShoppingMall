import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/product/data/product.dart';
import 'package:office_shopping_mall/feature/product/ui/product_description_content.dart';

class ProductDetailContent extends StatefulWidget{
  const ProductDetailContent({super.key});

  @override
  State<ProductDetailContent> createState() => _ProductDetailContent();

}

class _ProductDetailContent extends State<ProductDetailContent> {

  Product product = Product(id: 0, productName: '상품명', price: '1000', description: '', category: 0);

  final int _selectProductIndex = selectedProductIndex;

  List<bool> isSelected = [true, false];

  void _selectTab(int index) {
    setState(() {
      for(int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 228,
                child: product.imageUrl == null ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      '상품 이미지가 없습니다',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ) : PageView.builder(
                    itemCount: product.imageUrl!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(product.imageUrl![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    product.productName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    '${product.price}원',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )
                  ),

                ]
              ),

              SizedBox(height: 4),

              Text(
                '',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 20),

              ToggleButtons(
                borderRadius: BorderRadius.circular(20),
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                color: Colors.grey,
                isSelected: isSelected,
                onPressed: (index) {
                  _selectTab(index);
                },
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('상세 설명'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('리뷰'),
                  ),
                ]
              ),

              SizedBox(height: 20),

              if (isSelected[0])
                ProductDescriptionContent(product: product)
              else if (isSelected[1])
                Text('리뷰'),
            ]
          )

        )


      ],

    );
  }

}