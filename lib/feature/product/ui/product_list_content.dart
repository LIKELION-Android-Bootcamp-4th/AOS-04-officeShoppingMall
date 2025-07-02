import 'package:flutter/material.dart';


class ProductListContent extends StatelessWidget{
  const ProductListContent({super.key});

  @override
  Widget build(BuildContext context) {

    var products = ["td", "asd"];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          SizedBox(
            height: 20,
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '$index',
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }
              )
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Column(

              children: [



              ],


            )

          )
        ]




      )
    );

  }



}