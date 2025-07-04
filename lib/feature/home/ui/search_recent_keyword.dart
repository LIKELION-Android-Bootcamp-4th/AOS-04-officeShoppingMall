import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRecentKeyword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchRecentKeywordState();
  }
}

class _SearchRecentKeywordState extends State<SearchRecentKeyword>{
  //TODO: SharedPreferences 데이터로
  List<String> recentKeywords = ['검색1', '검색2', '검색3', '검색4', '검색5'];

  void _removeKeyword(String keyword) {
    setState(() {
      recentKeywords.remove(keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Container(

        )
    );
  }
}