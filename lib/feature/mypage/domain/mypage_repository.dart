import 'package:office_shopping_mall/core/data/models/user_dto.dart';
import 'package:office_shopping_mall/feature/mypage/data/mypage_service.dart';

class MypageRepository {
  final MypageService _service;

  MypageRepository(this._service);

  @override
  Future<UserDTO> getUser() => _service.fetchUser();
}
