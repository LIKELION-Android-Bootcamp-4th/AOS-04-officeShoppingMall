import 'package:flutter/material.dart';


class AddReviewContent extends StatefulWidget{

  @override
  State<AddReviewContent> createState() => _AddReviewContent();

}

class _AddReviewContent extends State<AddReviewContent>{

  @override
  Widget build(BuildContext context){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          "별점을 남겨주세요",
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        SizedBox(height: 16),



        SizedBox(height: 20),

        Text(
          "후기를 남겨주세요",
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        TextField(
          decoration: InputDecoration(
            hintText: "리뷰를 작성해주세요",
            border: OutlineInputBorder(),
          ),
          maxLines: 5,

        )

      ],

    );

  }

}