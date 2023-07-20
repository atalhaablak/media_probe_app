import 'package:flutter/material.dart';
import 'package:media_probe_app/core/constant/app_bar_titles.dart';
import 'package:media_probe_app/core/extensions/list_extension.dart';
import 'package:media_probe_app/core/init/injection.dart';
import 'package:media_probe_app/core/ui/widget/app_widget_state_builder.dart';
import 'package:media_probe_app/core/ui/widget/base_app_bar.dart';
import 'package:media_probe_app/core/ui/widget/drawer_widget.dart';
import 'package:media_probe_app/core/utils/route.dart';
import 'package:media_probe_app/core/utils/route_manager.dart';
import 'package:media_probe_app/core/utils/screen_size.dart';
import 'package:media_probe_app/feature/detail_screen/model/detail_screen_arguments.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';
import 'package:media_probe_app/feature/home_screen/widget/articles_item_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => serviceLocator<HomeViewModel>(),
      builder: (context, widget) {
        ScreenSize().screenSize = MediaQuery.of(context).size;
        return Scaffold(
          // TODO: Base Screen oluşturulacak
          appBar: const BaseAppBar(
            appBarTitle: AppBarTitles.homePage,
            isMoreVertIcon: true,
            isSearchable: true,
          ),
          body: Consumer<HomeViewModel>(
            builder: (context, homeViewModel, child) {
              return ApiResponseBuilder<List<MostPopularArticleDto>>(
                response: homeViewModel.articles,
                builder: (articles) {
                  return _buildArticleList(articles);
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildArticleList(List<MostPopularArticleDto> articles) {
    return ListView.builder(
      itemCount: articles.itemCount,
      itemBuilder: (context, index) {
        return ArticlesItemWidget(mostPopularArticleDto: articles[index]);
      },
    );
  }
}
