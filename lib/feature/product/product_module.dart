import 'package:dio/dio.dart';

import 'package:office_shopping_mall/feature/product/domain/repository/product_repository.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'data/product_viewmodel.dart';
import 'domain/product_repository_impl.dart';

List<SingleChildWidget> productModule = [


  ChangeNotifierProvider<ProductListViewModel>(
    create: (context) =>
        ProductListViewModel(context.read<ProductRepository>())..loadProducts(),
  ),
  ChangeNotifierProvider<ProductDataViewModel>(
    create: (context) =>
        ProductDataViewModel(),
  ),
];
