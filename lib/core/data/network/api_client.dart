import 'dart:io';

import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/network/interceptors/auth_interceptor.dart';
import 'package:office_shopping_mall/core/data/network/interceptors/logging_interceptor.dart';

class ApiClient {
  final Dio dio;
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  ApiClient._internal()
    : dio = Dio(
        BaseOptions(
          baseUrl: Api.baseUrl,
          responseType: ResponseType.json,
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 3),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      ) {
    dio.interceptors.addAll([LoggingInterceptor(), AuthInterceptor()]);
  }
}
