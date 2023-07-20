import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/ui/widget/r_edge_instes.dart';
import 'package:media_probe_app/core/init/injection.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/feature/detail_screen/detail_viewmodel.dart';
import 'package:media_probe_app/feature/detail_screen/widget/detail_screen_app_bar.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  // TODO: Viewmodel provider
  // TODO: BaseScreen

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => serviceLocator<DetailViewModel>(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: context.baseBackgroundColor,
          body: CustomScrollView(
            slivers: [
              const DetailScreenAppBar(
                imageUrl: "https://i.pinimg.com/originals/64/d5/10/64d510b12502d277047958e8cec49ecb.jpg",
                publishedDate: "Oct. 5, 2021",
              ),
              SliverPadding(
                padding: REdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Article like count widget
                    _buildArticleTitle(context),
                    _buildCopyRightInfo(context),
                    SizedBox(height: 16.h),
                    // Article detail widget
                    _buildArticleFullText(),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row _buildCopyRightInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.copyright_outlined,
          color: context.grey,
          size: 14.h,
        ),
        Text(
          "Emily Elconin for The New York Times",
          style: context.px12w400,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  Widget _buildArticleFullText() {
    return Text("data");
  }

  Row _buildArticleTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            'The article detail page should include the article title, the publish date of the article, an image related to the article, the full text of the article',
            style: context.px16w600.copyWith(color: context.black),
          ),
        ),
      ],
    );
  }
}
