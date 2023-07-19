import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:media_probe_app/core/error/failure.dart';
import 'package:media_probe_app/core/init/network/article_service/i_article_service.dart';
import 'package:media_probe_app/core/init/network/endpoint.dart';
import 'package:media_probe_app/core/init/network/service/i_network_manager.dart';

class ArticleService extends IArticleService {
  final INetworkManager _networkManager;

  ArticleService(this._networkManager);
  @override
  Future<Either<Failure, Map<String, dynamic>>> getArticles() async {
    Map<String, dynamic> articles = {};
    final response = await _networkManager.get(endPoint: ProjectEndpoint.mostViewedList);

    return response.fold((failure) => Left(failure), (data) {
      articles = Map<String, dynamic>.from(data);
      return Right(articles);
    });
  }
}
