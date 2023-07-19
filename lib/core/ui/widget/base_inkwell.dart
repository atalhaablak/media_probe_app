import 'package:flutter/material.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';

class BaseInkWell extends StatelessWidget {
  const BaseInkWell({
    Key? key,
    this.onTap,
    this.child,
  }) : super(key: key);

  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: context.transparent,
      highlightColor: context.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
