import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/search/presentation/models/recent_manager.dart';

class SearchRecentKeyword extends StatefulWidget {
  final Function(String)? onKeywordSelected;

  const SearchRecentKeyword({super.key, this.onKeywordSelected});

  @override
  State<StatefulWidget> createState() {
    return SearchRecentKeywordState();
  }
}

class SearchRecentKeywordState extends State<SearchRecentKeyword> {
  List<String> recentKeywords = [];

  Future<void> _loadRecentKeywords() async {
    final keywords = await RecentKeywordsManager.getRecentKeywords();
    setState(() {
      recentKeywords = keywords;
    });
  }

  Future<void> addKeyword(String keyword) async {
    await RecentKeywordsManager.addKeyword(keyword);
    await _loadRecentKeywords();
  }

  Future<void> removeKeyword(String keyword) async {
    await RecentKeywordsManager.removeKeyword(keyword);
    await _loadRecentKeywords();
  }

  @override
  void initState() {
    super.initState();
    _loadRecentKeywords();
  }

  @override
  Widget build(BuildContext context) {
    if (recentKeywords.isEmpty) {
      return SizedBox.shrink();
    }
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
                    backgroundColor: appColorScheme().tertiaryContainer,
                    side: BorderSide.none,
                    shape: StadiumBorder(),
                    labelPadding: EdgeInsets.only(left: 4.0, right: 4.0),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      widget.onKeywordSelected?.call(text);
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
                            removeKeyword(text);
                            print('삭제할 키워드는: $text');
                          },
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.black,
                          ),
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
