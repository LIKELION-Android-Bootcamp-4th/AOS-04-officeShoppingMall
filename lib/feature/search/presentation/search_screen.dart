import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/search/presentation/widgets/search_content_searchbar.dart';
import 'package:office_shopping_mall/feature/search/presentation/widgets/search_popular.dart';
import 'package:office_shopping_mall/feature/search/presentation/widgets/search_recent_keyword.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<SearchRecentKeywordState> _recentKeywordKey = GlobalKey();

  void _onSearchSubmitted(String keyword) {
    _recentKeywordKey.currentState?.addKeyword(keyword);
  }

  void _onKeywordSelected(String keyword) {
    //TODO: 검색기능 추가하기
    print('선택된 검색어: $keyword');
    _recentKeywordKey.currentState?.addKeyword(keyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SearchContentSearchBar(onSearchSubmitted: _onSearchSubmitted),
          SizedBox(height: 16),
          SearchRecentKeyword(
            key: _recentKeywordKey,
            onKeywordSelected: _onKeywordSelected,
          ),
          SizedBox(height: 32),
          Divider(),
          SizedBox(height: 16),
          SearchPopular(),
        ],
      ),
    );
  }
}
