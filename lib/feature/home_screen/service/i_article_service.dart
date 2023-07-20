import 'package:dartz/dartz.dart';
import 'package:media_probe_app/core/error/failure.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';

abstract class IArticleService {
  Future<Either<Failure, List<MostPopularArticleDto>>> getArticles();
  Future<String> getArticlesString({required String path});
}
