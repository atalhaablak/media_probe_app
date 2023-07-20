import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/ui/widget/circular_image_widget.dart';
import 'package:media_probe_app/core/ui/widget/r_edge_instes.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/core/ui/widget/base_inkwell.dart';
import 'package:media_probe_app/core/utils/route.dart';
import 'package:media_probe_app/core/utils/route_manager.dart';
import 'package:media_probe_app/feature/detail_screen/model/detail_screen_arguments.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';

// TODO: Data yüklenirken shimmer eklenebilir

class ArticlesItemWidget extends StatelessWidget {
  final MostPopularArticleDto mostPopularArticleDto;

  const ArticlesItemWidget({
    super.key,
    required this.mostPopularArticleDto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(20),
      child: Container(
        height: 120.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAvatarAndDate(context),
            SizedBox(width: 8.w),
            Expanded(
              child: _buildArticleInfo(mostPopularArticleDto, context),
            ),
            // SizedBox(width: 16.w),
            // _buildGoDetailButton(mostPopularArticleDto),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarAndDate(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularImageWidget(imageUrl: mostPopularArticleDto.firstImage),
        const Icon(Icons.calendar_month_rounded),
        Text(
          mostPopularArticleDto.publishedDate.getValueOrDefault,
          style: context.px14w500.copyWith(color: context.grey),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildArticleInfo(MostPopularArticleDto mostPopularArticleDto, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mostPopularArticleDto.title.getValueOrDefault,
          style: context.px15w500.copyWith(color: context.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (mostPopularArticleDto.byline.getValueOrDefault.isNotEmpty)
          Text(
            mostPopularArticleDto.byline.getValueOrDefault,
            style: context.px14w500.copyWith(color: context.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        Padding(
          padding: REdgeInsets.only(bottom: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: BaseInkWell(
              onTap: () => Go.to.page(
                detailPageRoute,
                arguments: DetailScreenArguments(
                  articleId: mostPopularArticleDto.id,
                  imageUrl: mostPopularArticleDto.firstImage,
                  publishedDate: mostPopularArticleDto.publishedDate,
                  title: mostPopularArticleDto.title,
                  fullText: mostPopularArticleDto.abstract, // Full Text olmadığı için abstract geçildi
                ),
              ),
              child: Text(
                "Show More",
                style: context.px14w500.copyWith(decoration: TextDecoration.underline),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
