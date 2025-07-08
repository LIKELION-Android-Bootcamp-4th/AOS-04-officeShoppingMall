import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: Api.baseUrl,
            responseType: ResponseType.json,
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 3),
            headers: {
              'X-Company-Code': '6866fd325b230f5dc709bdf7',
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.authorizationHeader:
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODY3YjY4ODczMTY4NmUyZTE5OTMwZjkiLCJjb21wYW55SWQiOiI2ODY2ZmQzMjViMjMwZjVkYzcwOWJkZjciLCJpc0FkbWluIjp0cnVlLCJpc1N1cGVyQWRtaW4iOmZhbHNlLCJpYXQiOjE3NTE4ODk1NTgsImV4cCI6MTc1MTk3NTk1OH0.HAn4klb7Ptlg8MGDzu6YpxUQ-wCM8xJSixeXlC5o0co',
            },
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: false,
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
