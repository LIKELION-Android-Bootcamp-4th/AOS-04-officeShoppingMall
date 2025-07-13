import 'package:dio/dio.dart';
import 'package:office_shopping_mall/feature/review/presentation/viewmodel/review_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'data/review_repository.dart';
import 'data/review_service.dart';

List<SingleChildWidget> reviewModule = [
  Provider<ReviewService>(
    create: (context) => ReviewService(context.read<Dio>()),
  ),

  Provider<ReviewRepository>(
    create: (context) => ReviewRepository(context.read<ReviewService>()),
  ),

  ChangeNotifierProvider(
    create: (context) => ReviewModel(context.read<ReviewRepository>()),
  ),
];
