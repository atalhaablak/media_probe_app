import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:media_probe_app/core/error/failure.dart';
import 'package:media_probe_app/core/init/network/endpoint.dart';
import 'package:media_probe_app/core/init/network/network_manager/i_network_manager.dart';

class NetworkManager extends INetworkManager {
  late final Dio _dio;

  NetworkManager() {
    final baseOptions = BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 50000,
      baseUrl: ProjectEndpoint.baseUrl, // TODO: .env yapısına aktarılacak
      contentType: Headers.jsonContentType,
      queryParameters: {
        "api-key": ProjectEndpoint.apiKey,
      },
    );

    _dio = Dio(baseOptions);

    final LogInterceptor logInterceptor = LogInterceptor(requestBody: true, error: true, responseBody: true);
    if (kDebugMode) _dio.interceptors.add(logInterceptor);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> get({required String endPoint}) async {
    return await _errorHandler(
      _dio.get(
        endPoint,
        options: Options(
          validateStatus: (_) => true,
        ),
      ),
    );
  }

  Future<Either<Failure, Map<String, dynamic>>> _errorHandler(Future<Response> requestFunction) async {
    Response response;
    try {
      response = await requestFunction;
    } catch (exception) {
      return Left(NotFoundFailure());
    }
    return _handleResponse(response);
  }

  Either<Failure, Map<String, dynamic>> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return Right(response.data);
    } else {
      return Left(NotFoundFailure());
    }
  }
}
