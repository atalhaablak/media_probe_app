import 'package:flutter/material.dart';
import 'package:media_probe_app/core/init/injection.dart';
import 'package:media_probe_app/core/init/network/article_service/i_article_service.dart';
import 'package:media_probe_app/core/utils/route.dart';
import 'package:media_probe_app/core/utils/route_manager.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';
import 'package:media_probe_app/feature/viewmodel/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  HomeViewModel() {
    _init();
  }

  List<MostPopularArticleDto> articles = [];

  void _init() {
    Future.wait([_getArticles()]);
  }

  Future<List<MostPopularArticleDto>> _getArticles() async {
    final response = await serviceLocator<IArticleService>().getArticles();
    articles = response.fold((failure) => articles, (data) {
      articles = data;
      return articles;
    });
    refreshView();
    return articles;
  }

  void goToDetailPage() {
    // TODO: hata var. İlgilen
    Go.to.page(detailPageRoute);
  }
}
