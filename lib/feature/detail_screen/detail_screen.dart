import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/ui/widget/r_edge_instes.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/core/viewmodel/viewmode_provider.dart';
import 'package:media_probe_app/feature/detail_screen/model/detail_screen_arguments.dart';
import 'package:media_probe_app/feature/detail_screen/widget/detail_screen_app_bar.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';

class DetailScreen extends StatelessWidget {
  final DetailScreenArguments arguments;
  const DetailScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      builder: (homeViewModel) {
        return Scaffold(
          backgroundColor: context.baseBackgroundColor,
          body: CustomScrollView(
            slivers: [
              DetailScreenAppBar(
                imageUrl: arguments.imageUrl.getValueOrDefault,
                publishedDate: arguments.publishedDate.getValueOrDefault,
              ),
              SliverPadding(
                padding: REdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildArticleTitle(context),
                    SizedBox(height: 16.h),
                    _buildArticleFullText(context),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildArticleFullText(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(10.0),
      child: Text(
        arguments.fullText.getValueOrDefault,
        style: context.px16w400.copyWith(color: context.black),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Row _buildArticleTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            arguments.title.getValueOrDefault,
            style: context.px16w600.copyWith(color: context.black),
          ),
        ),
      ],
    );
  }
}
