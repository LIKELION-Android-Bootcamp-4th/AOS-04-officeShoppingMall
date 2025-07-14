import 'package:dio/dio.dart';
import 'package:office_shopping_mall/feature/order/data/order_service.dart';
import 'package:office_shopping_mall/feature/order/domain/order_repository_impl.dart';
import 'package:office_shopping_mall/feature/order/domain/repository/order_repository.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_detail_viewmodel.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> orderModule = [
  Provider<OrderService> (
    create: (context) => OrderService(context.read<Dio>()),
  ),
  Provider<OrderRepository>(
    create: (context) => OrderRepositoryImpl(context.read<OrderService>()),
  ),
  ChangeNotifierProvider<OrderListViewModel>(
    create: (context) =>
    OrderListViewModel(context.read<OrderRepository>(), context.read<OrderService>())..loadOrders(),
  ),
  ChangeNotifierProvider<OrderDetailViewModel>(
    create: (context) =>
        OrderDetailViewModel(context.read<OrderRepository>())
  )
];