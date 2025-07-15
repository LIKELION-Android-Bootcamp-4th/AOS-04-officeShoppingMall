import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/data/models/dto/toggle_favorite_response.dart';
import '../../../core/data/models/dto/product_dto.dart';
import '../../../core/constants/api_endpoints.dart';

class ProductService {
  final Dio _dio;

  ProductService(this._dio);

  Future<void> createProduct(ProductDTO product) async {
    final response = await _dio.post(Api.product.getProducts(), data: product.toJson());

    if (response.statusCode == 201) {
      print('상품 등록 성공');
    } else {
      throw Exception('상품 등록 실패: ${response.statusCode}, message: ${response.data}');
    }
  }

  Future<List<ProductDTO>> getProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  }) async {
    final response = await _dio.get(
      Api.product.getProducts(categoryId: categoryId, category: category),
    );

    if (response.statusCode == 200) {
      final items = response.data['data']['items'] as List;

      return items.map((item) => ProductDTO.fromJson(item)).toList();
    } else {
      throw Exception('상품 목록 조회 실패: ${response.statusCode}, message: ${response.data}');
    }
  }

  Future<ProductDTO> getProductDetail(String id) async {
    final response = await _dio.get(Api.product.getProductDetail(id));

    if (response.statusCode == 200) {
      final data = response.data['data'];
      if (data == null) {
        throw Exception('상품 데이터가 없습니다.');
      }
      return ProductDTO.fromJson(data as Map<String, dynamic>);
    } else {
      throw Exception('상품 조회 실패: ${response.statusCode}, message: ${response.data}');
    }
  }

  Future<void> updateProduct(ProductDTO product) async {
    final response = await _dio.put(
      Api.product.getProductDetail(product.id),
      data: product.toJson(),
    );

    if (response.statusCode == 200) {
      print('상품 수정 성공!');
    } else {
      throw Exception('상품 수정 실패: ${response.statusCode}, message: ${response.data}');
    }
  }

  Future<void> updateProductScore(String productId, double score) async {
    final response = await _dio.patch(
      Api.product.getProductDetail(productId),
      data: {
        'score': score,
      },
    );

    if (response.statusCode == 200) {
      print('상품 score 수정 성공!');
    } else {
      throw Exception(
        '상품 score 수정 실패: ${response.statusCode}, message: ${response.data}',
      );
    }
  }

  Future<void> deleteProduct(String id) async {
    final response = await _dio.delete(Api.product.getProductDetail(id));

    if (response.statusCode == 200) {
      print('상품 삭제 성공!');
    } else {
      throw Exception('상품 삭제 실패: ${response.statusCode}, message: ${response.data}');
    }
  }

  Future<ToggleFavoriteResponse> toggleFavorite(String productId) async {
    final response = await _dio.post(Api.product.toggleFavorite(productId));

    if (response.statusCode == 200) {
      return ToggleFavoriteResponse.fromJson(response.data);
    }
    throw Exception(response.statusCode);
  }
}
