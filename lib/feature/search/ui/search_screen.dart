import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/search/ui/search_content_searchbar.dart';
import 'package:office_shopping_mall/feature/search/ui/search_popular.dart';
import 'package:office_shopping_mall/feature/search/ui/search_recent_keyword.dart';

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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SearchContentSearchBar(),
          SizedBox(height: 16,),
          SearchRecentKeyword(),
          SizedBox(height: 32,),
          Divider(),
          SizedBox(height: 16,),
          SearchPopular(),
        ],
      ),
    );
  }
}