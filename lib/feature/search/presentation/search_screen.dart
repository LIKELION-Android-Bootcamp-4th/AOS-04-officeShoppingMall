import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/search/presentation/viewmodel/search_viewmodel.dart';
import 'package:office_shopping_mall/feature/search/presentation/widgets/search_content_searchbar.dart';
import 'package:office_shopping_mall/feature/search/presentation/widgets/search_popular.dart';
import 'package:office_shopping_mall/feature/search/presentation/widgets/search_recent_keyword.dart';
import 'package:provider/provider.dart';
import '../../../core/data/network/api_client.dart';
import '../../product/data/product_service.dart';
import '../../product/domain/product_repository_impl.dart';
import '../../product/presentation/product_list_screen.dart';
import '../../product/presentation/viewmodel/product_list_viewmodel.dart';
import '../data/search_service.dart';
import '../domain/search_repository.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<SearchRecentKeywordState> _recentKeywordKey = GlobalKey();

  void _onSearchSubmitted(String keyword) async {
    _recentKeywordKey.currentState?.addKeyword(keyword);

    final viewModel = SearchViewModel(SearchRepository(SearchService()));

    try {
      await viewModel.searchProducts(keyword);
      final results = viewModel.searchResult;

      if (!context.mounted) return;

      if (results.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("상품이 없습니다.")));
        return;
      }

      final productListViewModel = ProductListViewModel(
        ProductRepositoryImpl(ProductService(ApiClient().dio)),
      );
      productListViewModel.setProductsFromSearch(results);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<ProductListViewModel>.value(
            value: productListViewModel,
            child: ProductListScreen(),
          ),
        ),
      );
    } catch (e) {
      print('검색 에러: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("검색 실패: $e")));
      }
    }
  }

  void _onKeywordSelected(String keyword) {
    print('선택된 검색어: $keyword');
    _onSearchSubmitted(keyword);
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
          SearchPopular(onKeywordSelected: _onKeywordSelected),
        ],
      ),
    );
  }
}
