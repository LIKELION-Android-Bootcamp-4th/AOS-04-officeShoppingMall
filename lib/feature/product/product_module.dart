import 'package:dio/dio.dart';

import 'package:office_shopping_mall/feature/product/domain/repository/product_repository.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'data/product_service.dart';
import 'presentation/viewmodel/product_viewmodel.dart';
import 'domain/product_repository_impl.dart';

List<SingleChildWidget> productModule = [

  Provider<ProductService>(
    create: (context) => ProductService(context.read<Dio>()),
  ),

  Provider<ProductRepository>(
    create: (context) => ProductRepositoryImpl(context.read<ProductService>()),
  ),

  ChangeNotifierProvider<ProductListViewModel>(
    create: (context) =>
        ProductListViewModel(context.read<ProductRepository>())..loadProducts(),
  ),
  ChangeNotifierProvider<ProductDataViewModel>(
    create: (context) =>
        ProductDataViewModel(),
  ),
];
