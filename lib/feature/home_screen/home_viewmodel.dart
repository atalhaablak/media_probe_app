import 'package:media_probe_app/core/init/injection.dart';
import 'package:media_probe_app/core/init/network/article_service/i_article_service.dart';
import 'package:media_probe_app/feature/viewmodel/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel() {
    _init();
  }

  void _init() {
    Future.wait([
      serviceLocator<IArticleService>().getArticles(),
    ]);
  }
}
