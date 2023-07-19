import 'package:flutter/material.dart';
import 'package:media_probe_app/core/init/injection.dart';
import 'package:media_probe_app/core/init/network/article_service/i_article_service.dart';
import 'package:media_probe_app/core/utils/route.dart';
import 'package:media_probe_app/core/utils/route_manager.dart';
import 'package:media_probe_app/feature/home_screen/model/artice_item_model.dart';
import 'package:media_probe_app/feature/viewmodel/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  HomeViewModel() {
    _init();
  }

  void _init() {
    Future.wait([
      serviceLocator<IArticleService>().getArticles(),
    ]);
  }

  void goToDetailPage() {
    Go.to.page(detailPageRoute);
  }

  // TODO: API'den alınacak
  List<ArticleItemModel> articleList = <ArticleItemModel>[
    ArticleItemModel(
      articeTitle: "Article Title Article TitleArticle TitleArticle Title",
      articleSubtitle:
          "Article Subtitle Article Subtitle Article Subtitle Article SubtitleArticle Subtitle Article SubtitleArticleSubtitleArticleSubtitleArticleSubtitle",
    ),
    ArticleItemModel(
      articeTitle: "Article Title Article TitleArticle TitleArticle Title",
      articleSubtitle:
          "Article Subtitle Article Subtitle Article Subtitle Article SubtitleArticle Subtitle Article SubtitleArticleSubtitleArticleSubtitleArticleSubtitle",
    ),
    ArticleItemModel(
      articeTitle: "Article Title Article TitleArticle TitleArticle Title",
      articleSubtitle:
          "Article Subtitle Article Subtitle Article Subtitle Article SubtitleArticle Subtitle Article SubtitleArticleSubtitleArticleSubtitleArticleSubtitle",
    ),
    ArticleItemModel(
      articeTitle: "Article Title Article TitleArticle TitleArticle Title",
      articleSubtitle:
          "Article Subtitle Article Subtitle Article Subtitle Article SubtitleArticle Subtitle Article SubtitleArticleSubtitleArticleSubtitleArticleSubtitle",
    ),
  ];
}
