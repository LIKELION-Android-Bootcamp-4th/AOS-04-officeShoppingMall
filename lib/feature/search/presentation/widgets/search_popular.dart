import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:office_shopping_mall/feature/search/presentation/viewmodel/search_viewmodel.dart';
import '../../../../core/theme/theme.dart';

class SearchPopular extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPopularState();
  }
}

class SearchPopularState extends State<SearchPopular> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchViewModel>(context, listen: false).getPopularKeywords();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchViewModel>(context);
    final keywords = viewModel.popularDataDto?.keywords ?? [];

    if (viewModel.isLoading) {
      return Center(child: CustomCircleIndicator());
    }

    if (viewModel.error != null) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Text('에러 발생: ${viewModel.error}'),
      );
    }

    if (keywords.length < 10) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Text('인기 검색어 데이터가 부족합니다'),
      );
    }
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
                    _rankItem(rowIndex, keywords[rowIndex].keyword),
                    SizedBox(width: 70),
                    _rankItem(rowIndex + 5, keywords[rowIndex + 5].keyword),
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