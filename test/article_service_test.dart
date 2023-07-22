import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe_app/core/error/failure.dart';
import 'package:media_probe_app/core/extensions/list_extension.dart';
import 'package:media_probe_app/core/init/network/endpoint.dart';
import 'package:media_probe_app/core/init/network/network_manager/network_manager.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';
import 'package:media_probe_app/feature/home_screen/service/article_service.dart';
import 'package:mockito/mockito.dart';

class MockManager extends Mock implements NetworkManager {
  late final Dio _dio;

  MockManager() {
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

/* Test yazımı bilgim dahilinde olan bir konu değildi. İlk denemeyi görüntülenmektedir. Case Study teslim edildiğinde 
article service test - success case testi yapıldı. Ekleme görürseniz daha sornasında öğrenmek için yaptığım çalışmalardır. */

void main() {
  final MockManager manager = MockManager();
  final ArticleService articleService = ArticleService(manager);

  setUp(() {});
  tearDown(() {});

  test("article service test - success case", () async {
    // sahte bir response datası oluşturulur
    final mockResponse = {
      "_r": [
        MostPopularArticleDto(
          title: "Article 1",
          media: [],
          publishedDate: DateTime.now().toString(),
        ),
        MostPopularArticleDto(
          title: "Article 1",
          media: [],
          publishedDate: DateTime.now().toString(),
        ),
      ],
    };

    // getArticles fonksiyonu çağırılır
    final result = await articleService.getArticles();

    // sonuç kontrol edilir
    expect(result.isRight(), true); // sonucun başarılı olduğu kontrol edilir
    expect(result.getOrElse(() => []), isA<List<MostPopularArticleDto>>()); // sonucun MostPopularArticleDto listesi içerdiği kontrol edilir

    // articles listesinin boş olmadığı kontrol edilir
    final articles = result.getOrElse(() => []);
    // articles listesindeki her bir elemanın media listesinin boş olmadığı kontrol edilir
    expect(articles.any((article) => article.media.getValueOrDefault.isEmpty), false);
  });
}
