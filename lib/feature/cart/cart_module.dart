import 'package:dio/dio.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_service.dart';
import 'package:office_shopping_mall/feature/cart/domain/cart_repository_impl.dart';
import 'package:office_shopping_mall/feature/cart/domain/repository/cart_repository.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> cartModule = [
  Provider<CartService>(create: (context) => CartService(context.read<Dio>())),

  Provider<CartRepository>(create: (context) => CartRepositoryImpl(context.read<CartService>())),

  ChangeNotifierProvider<CartViewModel>(
    create: (context) => CartViewModel(context.read<CartRepository>()),
  ),
];
