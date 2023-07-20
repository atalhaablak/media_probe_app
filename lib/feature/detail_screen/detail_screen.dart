import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/functions/edge_instes_functions.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/core/ui/widget/html_widget.dart';
import 'package:media_probe_app/feature/detail_screen/mock/mock_data.dart';
import 'package:media_probe_app/feature/detail_screen/widget/detail_screen_app_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

  FlutterHtmlWidget _buildArticleFullText() {
    return const FlutterHtmlWidget(
      data: MockData.mockData,
    );
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
