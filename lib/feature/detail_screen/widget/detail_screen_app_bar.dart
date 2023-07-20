import 'package:flutter/material.dart';
import 'package:media_probe_app/core/constant/app_bar_titles.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';

class DetailScreenAppBar extends StatelessWidget {
  final String imageUrl;
  final String publishedDate;
  const DetailScreenAppBar({super.key, required this.imageUrl, required this.publishedDate});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200, // Banner'ın büyüklüğü
      floating: true,
      pinned: true,
      backgroundColor: context.transparent,
      title: Text(AppBarTitles.articleDetails, style: context.px18w500.copyWith(color: context.white)),
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imageUrl, // Banner resmi burada
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: context.grey,
                    child: Center(
                      child: Icon(Icons.error_outline, color: context.white),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: Row(
                children: [
                  Icon(Icons.calendar_month_rounded, color: context.white),
                  SizedBox(width: 4.w),
                  Text(
                    publishedDate,
                    style: context.px14w500.copyWith(color: context.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
