import 'package:flutter/material.dart';


class ProductItem extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Expanded(
            child: Container(

              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),

            ),

        ),

        SizedBox(height: 8),

        Text(
          '상품명',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),

        SizedBox(height: 6),

        Text(
          '가격',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey
          )
        )

      ]


    );

  }



}