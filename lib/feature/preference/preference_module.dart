import 'package:office_shopping_mall/feature/preference/data/preference_service.dart';
import 'package:office_shopping_mall/feature/preference/domain/preference_repository.dart';
import 'package:office_shopping_mall/feature/preference/presentation/viewmodel/preference_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> preferenceModule = [
  Provider<PreferenceService>(create: (context) => PreferenceService()),

  Provider<PreferenceRepository>(
    create: (context) => PreferenceRepository(context.read<PreferenceService>()),
  ),

  ChangeNotifierProvider<PreferenceViewModel>(
    create: (context) => PreferenceViewModel(context.read<PreferenceRepository>()),
  ),
];
