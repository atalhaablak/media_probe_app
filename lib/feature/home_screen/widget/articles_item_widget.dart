import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/list_extension.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/ui/widget/circular_image_widget.dart';
import 'package:media_probe_app/core/ui/widget/r_edge_instes.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/core/ui/widget/base_inkwell.dart';
import 'package:media_probe_app/feature/home_screen/data/most_popular_article_dto.dart';

// TODO: Data yüklenirken shimmer eklenebilir

class ArticlesItemWidget extends StatelessWidget {
  final MostPopularArticleDto mostPopularArticleDto;
  final Function() onTap;

  const ArticlesItemWidget({
    super.key,
    required this.mostPopularArticleDto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularImageWidget(imageUrl: mostPopularArticleDto.firstImage),
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
        if (mostPopularArticleDto.byline.getValueOrDefault.isNotEmpty)
          Text(
            mostPopularArticleDto.byline.getValueOrDefault,
            style: context.px14w500.copyWith(color: context.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        SizedBox(width: 8.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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

  Widget _buildGoDetailButton(Function() onTap) {
    return BaseInkWell(
      onTap: onTap,
      child: Icon(
        Icons.chevron_right_outlined,
        size: 24.h,
      ),
    );
  }
}
