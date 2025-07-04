import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/home/ui/search_content_searchbar.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchContentSearchBar(),
          SizedBox(height: 20,),
          Container(
            width: 200,
            height: 200,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}