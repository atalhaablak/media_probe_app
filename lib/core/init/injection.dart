import 'package:get_it/get_it.dart';
import 'package:media_probe_app/core/init/network/article_service/article_service.dart';
import 'package:media_probe_app/core/init/network/article_service/i_article_service.dart';
import 'package:media_probe_app/core/init/network/dio_manager.dart';
import 'package:media_probe_app/core/init/network/service/i_network_manager.dart';
import 'package:media_probe_app/core/init/network/service/network_manager.dart';
import 'package:media_probe_app/feature/detail_screen/detail_viewmodel.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';
import 'package:media_probe_app/feature/viewmodel/base_view_model.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //services
  serviceLocator.registerLazySingleton<INetworkManager>(() => NetworkManager(DioManager.getBaseDio()));
  serviceLocator.registerLazySingleton<IArticleService>(() => ArticleService(serviceLocator()));

  //viewModels
  serviceLocator.registerLazySingleton<BaseViewModel>(() => BaseViewModel());
  serviceLocator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  serviceLocator.registerLazySingleton<DetailViewModel>(() => DetailViewModel());
}
