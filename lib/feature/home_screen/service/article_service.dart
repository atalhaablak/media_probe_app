import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:media_probe_app/core/error/failure.dart';
import 'package:media_probe_app/core/extensions/list_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/init/network/endpoint.dart';
import 'package:media_probe_app/core/init/network/network_manager/i_network_manager.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';
import 'package:media_probe_app/feature/home_screen/service/i_article_service.dart';

class ArticleService extends IArticleService {
  final INetworkManager _networkManager;

  ArticleService(this._networkManager);

  @override

  /// makale listesini getirir
  Future<Either<Failure, List<MostPopularArticleDto>>> getArticles() async {
    List<MostPopularArticleDto> articles = [];
    final response = await _networkManager.get(endPoint: ProjectEndpoint.mostViewedList);

    return response.fold((failure) => Right(articles), (data) {
      articles = data["results"].map<MostPopularArticleDto>((json) => MostPopularArticleDto.fromJson(json)).toList();
      // media'sı boş olanlar çıkarılır
      articles.removeWhere((element) => element.media.getValueOrDefault.isEmpty);
      // published_date'e göre yeniden eskiye sıralanır
      articles.sort((a, b) => b.publishedDate.getValueOrDefault.compareTo(a.publishedDate.getValueOrDefault));
      return Right(articles);
    });
  }
}
