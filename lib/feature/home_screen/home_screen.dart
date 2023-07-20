import 'package:flutter/material.dart';
import 'package:media_probe_app/core/constant/app_bar_titles.dart';
import 'package:media_probe_app/core/extensions/list_extension.dart';
import 'package:media_probe_app/core/ui/widget/api_response_builder.dart';
import 'package:media_probe_app/core/ui/widget/base_screen.dart';
import 'package:media_probe_app/core/utils/screen_size.dart';
import 'package:media_probe_app/core/viewmodel/viewmode_provider.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';
import 'package:media_probe_app/feature/home_screen/widget/articles_item_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      builder: (homeViewModel) {
        ScreenSize().screenSize = MediaQuery.of(context).size;
        return BaseScreen(
          showAppBar: true,
          screenName: AppBarTitles.homePage,
          pageTitle: AppBarTitles.homePage,
          isShowMoreVertIcon: true,
          isSearchable: true,
          child: Consumer<HomeViewModel>(
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
