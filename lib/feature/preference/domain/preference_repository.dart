import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/feature/preference/data/preference_service.dart';

class PreferenceRepository {
  final PreferenceService _service;

  PreferenceRepository(this._service);

  Future<List<ProductDTO>> fetchPreference({String? sort, String? order}) async {
    return await _service.getPreference(limit: 100, sort: sort, order: order);
  }
}
