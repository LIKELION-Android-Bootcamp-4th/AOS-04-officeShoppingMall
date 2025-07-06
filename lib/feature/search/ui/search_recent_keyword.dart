import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRecentKeyword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchRecentKeywordState();
  }
}

class _SearchRecentKeywordState extends State<SearchRecentKeyword> {
  //TODO: SharedPreferences 데이터로
  List<String> recentKeywords = ['검색1', '검색2', '검색3', '검색4', '검색5'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Text('최근 검색어', style: appTextTheme().bodyLarge),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: recentKeywords.map((text) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 100),
                  child: ActionChip(
                    backgroundColor: Color(0x3070AEFF),
                    side: BorderSide.none,
                    shape: StadiumBorder(),
                    labelPadding: EdgeInsets.only(left: 4.0, right: 4.0),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      //TODO: 검색 이벤트 추가할 것
                      print('최근 검색어는 : $text');
                    },
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60,
                          height: 18,
                          child: Text(text, style: appTextTheme().labelLarge),
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: 삭제 이벤트 추가할 것
                            print('삭제할 키워드는: $text');
                          },
                          child: Icon(Icons.close, size: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
