import 'package:dartz/dartz.dart';
import 'package:media_probe_app/core/error/failure.dart';

abstract class IArticleService {
  Future<Either<Failure, Map<String, dynamic>>> getArticles();
}
