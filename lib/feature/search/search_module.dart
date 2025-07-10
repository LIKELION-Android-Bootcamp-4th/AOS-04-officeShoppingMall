import 'package:office_shopping_mall/feature/search/data/search_service.dart';
import 'package:office_shopping_mall/feature/search/domain/search_repository.dart';
import 'package:office_shopping_mall/feature/search/presentation/viewmodel/search_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> searchModule = [
  Provider<SearchService>(create: (context) => SearchService()),

  Provider<SearchRepository>(create: (context) => SearchRepository(context.read<SearchService>())),

  ChangeNotifierProvider<SearchViewModel>(
      create: (context) => SearchViewModel(context.read<SearchRepository>()..getPopularKeyword())
  ),
];