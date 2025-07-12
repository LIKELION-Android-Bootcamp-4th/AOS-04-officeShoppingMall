import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/feature/preference/data/preference_service.dart';

class PreferenceRepository {
  final PreferenceService _service;

  PreferenceRepository(this._service);

  Future<List<Product>> fetchPreference({String? sort, String? order}) async {
    final responses = await _service.getPreference(limit: 100, sort: sort, order: order);
    return responses.map((response) => Product.fromDTO(response)).toList();
  }

  Future<bool> toggleFavorite(String id) => _service.toggleFavorite(id);
}
