import 'package:dio/dio.dart';
import 'package:office_shopping_mall/feature/notification/data/notification_service.dart';
import 'package:office_shopping_mall/feature/notification/domain/notification_repository.dart';
import 'package:office_shopping_mall/feature/notification/presentation/viewmodel/notification_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> notificationModule = [
  Provider<NotificationService>(
      create: (context) => NotificationService(context.read<Dio>())
  ),
  Provider<NotificationRepository>(
      create: (context) => NotificationRepository(context.read<NotificationService>())
  ),
  ChangeNotifierProvider<NotificationViewModel>(
      create: (context) => NotificationViewModel(
        context.read<NotificationRepository>(),
      )
  )
];