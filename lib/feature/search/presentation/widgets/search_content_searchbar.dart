import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';

class SearchContentSearchBar extends StatefulWidget {
  final Function(String)? onSearchSubmitted;

  const SearchContentSearchBar({super.key, this.onSearchSubmitted});

  @override
  State<StatefulWidget> createState() {
    return _SearchContentSearchBarState();
  }
}

class _SearchContentSearchBarState extends State<SearchContentSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  void _handleSearch() {
    final keyword = _searchController.text;
    if (keyword.isNotEmpty) {
      widget.onSearchSubmitted?.call(keyword);
      _searchController.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: 56,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('images/icon/ic_back.svg'),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: SearchBar(
                      controller: _searchController,
                      onSubmitted: (value) => _handleSearch(),
                      trailing: [
                        IconButton(
                          onPressed: () {
                            _handleSearch();
                          },
                          icon: SvgPicture.asset(
                            'images/icon/ic_appbar_search.svg',
                          ),
                        ),
                      ],
                      backgroundColor: WidgetStateProperty.all(
                        AppColors.gray200,
                      ),
                      elevation: WidgetStateProperty.all(0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
