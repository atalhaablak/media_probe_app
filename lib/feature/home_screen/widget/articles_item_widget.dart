import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/functions/edge_instes_functions.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/core/ui/widget/base_inkwell.dart';
import 'package:media_probe_app/core/utils/route.dart';
import 'package:media_probe_app/feature/detail_screen/detail_screen.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';
import 'package:media_probe_app/feature/home_screen/model/artice_item_model.dart';
import 'package:provider/provider.dart';

class ArticlesItemWidget extends StatelessWidget {
  const ArticlesItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: homeViewModel.articleList.length,
            itemBuilder: (context, index) {
              return _buildArticlesItem(
                context: context,
                articleItemModel: homeViewModel.articleList[index],
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
      },
    );
  }

  Padding _buildArticlesItem({required BuildContext context, required ArticleItemModel articleItemModel, required Function() onTap}) {
    return Padding(
      padding: REdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircularImage(context),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articleItemModel.articeTitle,
                  style: context.px16w600.copyWith(color: context.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        articleItemModel.articleSubtitle,
                        style: context.px14w400.copyWith(color: context.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.calendar_month_rounded)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          BaseInkWell(
            onTap: onTap,
            child: Icon(
              Icons.chevron_right_outlined,
              size: 32.h,
            ),
          ),
        ],
      ),
    );
  }

  CircleAvatar _buildCircularImage(BuildContext context) {
    return CircleAvatar(
      radius: 30.r,
      backgroundColor: context.grey,
      child: const Icon(
        // TODO: image eklenecek
        Icons.person,
        color: Colors.black,
      ),
    );
  }
}
