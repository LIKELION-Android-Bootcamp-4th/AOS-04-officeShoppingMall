import 'package:office_shopping_mall/core/data/models/dto/toggle_favorite_response.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/mypage/data/mypage_service.dart';

class MypageRepository {
  final MypageService _service;

  MypageRepository(this._service);

  Future<User> getUser() async => User.fromDTO(await _service.fetchUser());

  Future<List<Product>> getRecent({int? page, int? limit}) async {
    final dtos = await _service.fetchRecent(page: page ?? 1, limit: limit ?? 50);
    return dtos.map((dto) => Product.fromDTO(dto)).toList();
  }

  Future<ToggleFavoriteResponse> toggleFavorite(String id) => _service.toggleFavorite(id);
}
