import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/mypage/data/mypage_service.dart';

class MypageRepository {
  final MypageService _service;

  MypageRepository(this._service);

  Future<User> getUser() async => User.fromDTO(await _service.fetchUser());
}
