import 'package:get_it/get_it.dart';
import 'package:media_probe_app/feature/home_screen/service/article_service.dart';
import 'package:media_probe_app/core/init/network/network_manager/i_network_manager.dart';
import 'package:media_probe_app/core/init/network/network_manager/network_manager.dart';
import 'package:media_probe_app/feature/detail_screen/detail_viewmodel.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';
import 'package:media_probe_app/feature/home_screen/service/i_article_service.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //services
  serviceLocator.registerLazySingleton<INetworkManager>(() => NetworkManager());
  serviceLocator.registerLazySingleton<IArticleService>(() => ArticleService(serviceLocator()));

  //viewModels

  serviceLocator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  serviceLocator.registerLazySingleton<DetailViewModel>(() => DetailViewModel());
}
