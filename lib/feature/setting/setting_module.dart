import 'package:dio/dio.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_service.dart';
import 'package:office_shopping_mall/feature/setting/domain/setting_repository.dart';
import 'package:office_shopping_mall/feature/setting/presentation/viewmodel/setting_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> settingModule = [
  Provider<SettingService>(create: (context) => SettingService(context.read<Dio>())),

  Provider<SettingRepository>(
    create: (context) => SettingRepository(context.read<SettingService>()),
  ),

  ChangeNotifierProvider<SettingViewModel>(
    create: (context) => SettingViewModel(context.read<SettingRepository>()),
  ),
];
