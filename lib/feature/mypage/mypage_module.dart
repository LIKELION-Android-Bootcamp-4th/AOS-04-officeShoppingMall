
import 'package:office_shopping_mall/feature/mypage/data/mypage_service.dart';
import 'package:office_shopping_mall/feature/mypage/domain/mypage_repository.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/viewmodel/mypage_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> mypageModule = [
  Provider<MypageService>(create: (ctx) => MypageService()),

  Provider<MypageRepository>(create: (ctx) => MypageRepository(ctx.read<MypageService>())),

  ChangeNotifierProvider<MypageViewModel>(
    create: (ctx) => MypageViewModel(ctx.read<MypageRepository>()),
  ),
];
