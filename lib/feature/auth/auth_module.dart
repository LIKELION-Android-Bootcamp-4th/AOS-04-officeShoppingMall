import 'package:office_shopping_mall/feature/auth/data/auth_service.dart';
import 'package:office_shopping_mall/feature/auth/domain/auth_repository.dart';
import 'package:office_shopping_mall/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> authModule = [
  Provider<AuthService>(create: (context) => AuthService()),

  Provider<AuthRepository>(create: (context) => AuthRepository(context.read<AuthService>())),

  ChangeNotifierProvider<AuthViewModel>(
    create: (context) => AuthViewModel(context.read<AuthRepository>()),
  ),
];