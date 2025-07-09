import 'package:office_shopping_mall/feature/mypage/data/mypage_service.dart';
import '../../../core/data/models/dto/user_dto.dart';

class MypageRepository {
  final MypageService _service;

  MypageRepository(this._service);

  @override
  Future<UserDTO> getUser() => _service.fetchUser();
}
