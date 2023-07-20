import 'package:media_probe_app/core/init/injection.dart';
import 'package:media_probe_app/feature/home_screen/article_service/i_article_service.dart';
import 'package:media_probe_app/core/ui/widget/ui_state.dart';
import 'package:media_probe_app/core/utils/route.dart';
import 'package:media_probe_app/core/utils/route_manager.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';
import 'package:media_probe_app/core/viewmodel/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel() {
    _getArticles();
  }

  UIState<List<MostPopularArticleDto>> articles = UIState.idle();

  Future<void> _getArticles() async {
    articles = UIState.loading();
    final response = await serviceLocator<IArticleService>().getArticles();
    articles = response.fold((failure) {
      return UIState.error(failure.message);
    }, (data) {
      return UIState.success(data);
    });
    refreshView();
  }

  void goToDetailPage() {
    Go.to.page(detailPageRoute);
  }
}
