import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final bool? isSearchable;
  final bool? isMoreVertIcon;
  final bool? isBackIcon;
  const BaseAppBar({
    super.key,
    required this.appBarTitle,
    this.isSearchable,
    this.isMoreVertIcon,
    this.isBackIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.appBarColor,
      title: Text(
        appBarTitle,
        style: context.px16w500.copyWith(
          color: context.white,
        ),
      ),
      actions: [
        Visibility(
          visible: isSearchable ?? false,
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        Visibility(
          visible: isMoreVertIcon ?? false,
          child: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
