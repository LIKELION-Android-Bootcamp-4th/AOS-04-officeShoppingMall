import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class SearchPopular extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPopularState();
  }
}

class SearchPopularState extends State<SearchPopular> {
  final List<String> popularSearches = [
    '검색어1',
    '검색어2',
    '검색어3',
    '검색어4',
    '검색어5',
    '검색어6',
    '검색어7',
    '검색어8',
    '검색어9',
    '검색어10',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Text('인기 검색어', style: appTextTheme().bodyLarge),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: List.generate(5, (rowIndex) {
              return Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _rankItem(rowIndex, popularSearches[rowIndex]),
                    SizedBox(width: 70),
                    _rankItem(rowIndex + 5, popularSearches[rowIndex + 5]),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _rankItem(int index, String keyword) {
    return GestureDetector(
      onTap: () {
        print('지금의 인기 검색어: $keyword');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            alignment: Alignment.centerLeft,
            child: Text('${index + 1}', style: appTextTheme().bodyLarge),
          ),
          SizedBox(width: 12),
          SizedBox(
            width: 72,
            child: Text(
              keyword,
              style: appTextTheme().bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
