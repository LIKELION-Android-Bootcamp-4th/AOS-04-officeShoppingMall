import 'package:dio/dio.dart';
import 'models/product.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/data/services/api_client.dart';

class ProductService {
  final Dio _dio = ApiClient.dio;

  Future<void> createProduct(Product product) async {
    final response = await _dio.post(
      Api.product.getProducts(),
      data: product.toJson(),
    );

    if (response.statusCode == 201) {
      print('상품 등록 성공');
    } else {
      throw Exception('상품 등록 실패: ${response.statusCode}');
    }
  }

  Future<List<Product>> getProducts({
    String? q,
    String? categoryId,
    String? category,
    String? sort,
  }) async {
    final url = Api.product.getProducts(
      q: q,
      categoryId: categoryId,
      category: category,
      sort: sort,
    );

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      final items = response.data['data']['items'] as List;
      return items.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('상품 목록 조회 실패: ${response.statusCode}');
    }
  }

  Future<Product> getProductDetail(String id) async {
    final response = await _dio.get(
      Api.product.getProductDetail(id),
    );

    if (response.statusCode == 200) {
      final data = response.data['data'] as Map<String, dynamic>;
      return Product.fromJson(data);
    } else {
      throw Exception('상품 조회 실패: ${response.statusCode}');
    }
  }

  Future<void> updateProduct(Product product) async {
    final response = await _dio.put(
      Api.product.getProductDetail(product.id),
      data: product.toJson(),
    );

    if (response.statusCode == 200) {
      print('상품 수정 성공!');
    } else {
      throw Exception('상품 수정 실패: ${response.statusCode}');
    }
  }

  Future<void> deleteProduct(String id) async {
    final response = await _dio.delete(
      Api.product.getProductDetail(id),
    );

    if (response.statusCode == 200) {
      print('상품 삭제 성공!');
    } else {
      throw Exception('상품 삭제 실패: ${response.statusCode}');
    }
  }
}