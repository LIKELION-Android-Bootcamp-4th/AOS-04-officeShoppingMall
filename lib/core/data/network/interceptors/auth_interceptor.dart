import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/data/network/secure_storage.dart';
import 'package:office_shopping_mall/main.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final companyCode = Api.xCompany;
    final token = await SecureStorage.loadAccessToken();

    if (token != null) options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    if (companyCode != null) options.headers['X-Company-Code'] = companyCode;

    // 인터셉터 처리 시 중단하지 않고 다음 단계 진행
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    Logger log = Logger();

    log.d(err.stackTrace);
    log.d(err.message);

    if (err.response?.statusCode == 403) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.login,
        (route) => false,
        arguments: AppRoutes.home,
      );

      // ScaffoldMessenger: UI와 먼 네트워크 계층에서 알림 표시를 위해 사용
      ScaffoldMessenger.of(
        navigatorKey.currentContext!,
      ).showSnackBar(const SnackBar(content: Text('로그인 세션이 만료되었습니다. 다시 로그인해주세요.')));
    }

    // 요청을 더이상 진행하지 않음
    handler.next(err);
  }
}
