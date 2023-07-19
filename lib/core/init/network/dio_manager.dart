import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:media_probe_app/core/init/network/endpoint.dart';

class DioManager {
  static Dio getBaseDio() {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: ProjectEndpoint.baseUrl, // TODO: .env yapısına aktarılacak
      contentType: Headers.jsonContentType,
      queryParameters: {
        "api-key": ProjectEndpoint.apiKey,
      },
    );

    final LogInterceptor logInterceptor = LogInterceptor(requestBody: true, error: true, responseBody: true);
    if (kDebugMode) dio.interceptors.add(logInterceptor);

    return dio;
  }
}
