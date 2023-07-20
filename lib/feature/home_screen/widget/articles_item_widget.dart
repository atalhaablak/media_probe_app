import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/list_extension.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/functions/edge_instes_functions.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/core/ui/widget/app_widget_state_builder.dart';
import 'package:media_probe_app/core/ui/widget/base_inkwell.dart';
import 'package:media_probe_app/feature/detail_screen/detail_screen.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';
import 'package:provider/provider.dart';

// TODO: Data yüklenirken shimmer eklenebilir

class ArticlesItemWidget extends StatelessWidget {
  const ArticlesItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return AppWidgetBuilderByState<List<MostPopularArticleDto>>(
            response: homeViewModel.articles,
            builder: (articles) {
              return _buildArticleList(articles);
            });
      },
    );
  }

  Widget _buildArticleList(List<MostPopularArticleDto> articles) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.itemCount,
        itemBuilder: (context, index) {
          return _buildArticlesItem(
            context: context,
            mostPopularArticleDto: articles[index],
            onTap: () => Navigator.of(context).push(
              // TODO: Navigator yapısına bakılacak
              MaterialPageRoute(
                builder: (context) => const DetailScreen(),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _buildArticlesItem({required BuildContext context, required MostPopularArticleDto mostPopularArticleDto, required Function() onTap}) {
    return Padding(
      padding: REdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircularImage(context, mostPopularArticleDto),
          SizedBox(width: 16.w),
          Expanded(
            child: _buildArticleInfo(mostPopularArticleDto, context),
          ),
          SizedBox(width: 16.w),
          _buildGoDetailButton(onTap),
        ],
      ),
    );
  }

  Widget _buildGoDetailButton(Function() onTap) {
    return BaseInkWell(
      onTap: onTap,
      child: Icon(
        Icons.chevron_right_outlined,
        size: 24.h,
      ),
    );
  }

  Widget _buildArticleInfo(MostPopularArticleDto mostPopularArticleDto, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mostPopularArticleDto.title.getValueOrDefault,
          style: context.px15w500.copyWith(color: context.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                mostPopularArticleDto.byline.getValueOrDefault,
                style: context.px14w500.copyWith(color: context.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8.w),
            const Icon(Icons.calendar_month_rounded),
            SizedBox(width: 4.w),
            Text(
              mostPopularArticleDto.publishedDate.getValueOrDefault,
              style: context.px14w500.copyWith(color: context.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircularImage(BuildContext context, MostPopularArticleDto mostPopularArticleDto) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36.r),
      child: (mostPopularArticleDto.media).getValueOrDefault.isNotEmpty
          ? Image.network((mostPopularArticleDto.media?.first.mediaMetadata?.first.url).getValueOrDefault,
              errorBuilder: (context, error, stackTrace) => Container(
                    width: 72.w,
                    height: 72.w,
                    color: context.grey,
                    child: Icon(
                      Icons.image_not_supported_rounded,
                      color: context.white,
                    ),
                  ))
          : Container(
              width: 72.w,
              height: 72.w,
              color: context.grey,
              child: Icon(
                Icons.image_not_supported_rounded,
                color: context.white,
              ),
            ),
    );
  }
}
