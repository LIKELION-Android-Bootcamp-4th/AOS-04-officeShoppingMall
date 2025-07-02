import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: 'http://git.hansul.kr:3000/',
            responseType: ResponseType.json,
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 3),
            headers: {
              'X-Company-Code': '685f69fc439922c09c21aef0',
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.authorizationHeader:
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODVmNjlmYzQzOTkyMmMwOWMyMWFlZjMiLCJjb21wYW55SWQiOiI2ODVmNjlmYzQzOTkyMmMwOWMyMWFlZjAiLCJpc0FkbWluIjp0cnVlLCJpc1N1cGVyQWRtaW4iOnRydWUsImlhdCI6MTc1MTMzOTI2OCwiZXhwIjoxNzUxNDI1NjY4fQ.oRj5tVMltqCJ0Su_lVZy9PGiUyZ94NVFS4DnI4_Pc1w',
            },
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: false,
            responseBody: true,
            error: true,
            compact: true,
            maxWidth: 100,
            enabled: kDebugMode,
          ),
        );
}
