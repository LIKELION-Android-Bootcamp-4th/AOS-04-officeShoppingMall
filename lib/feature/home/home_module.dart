import 'package:office_shopping_mall/feature/home/data/home_service.dart';
import 'package:office_shopping_mall/feature/home/domain/home_repository.dart';
import 'package:office_shopping_mall/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> homeModule = [
  Provider<HomeService>(create: (context) => HomeService()),

  Provider<HomeRepository>(create: (context) => HomeRepository(context.read<HomeService>())),

  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<HomeRepository>()),
  ),
];
