import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/widget/base_app_bar.dart';

class BaseScreen extends StatefulWidget {
  final String? pageTitle;
  final Widget child;
  final Widget? appBarLeading;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool showAppBar;
  final Widget? pageTitleWidget;
  final Widget? backButtonIcon;
  final String screenName;
  final bool automaticallyImplyLeading;
  final bool showCustomElevation;
  final void Function()? onTap;
  final bool isShowMoreVertIcon;
  final bool isSearchable;

  const BaseScreen({
    Key? key,
    this.pageTitle = "",
    required this.child,
    this.appBarLeading,
    this.showBackButton = true,
    this.actions,
    this.showAppBar = true,
    this.pageTitleWidget,
    this.backButtonIcon,
    required this.screenName,
    this.onTap,
    this.automaticallyImplyLeading = true,
    this.showCustomElevation = false,
    this.isShowMoreVertIcon = false,
    this.isSearchable = false,
  }) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.baseBackgroundColor,
      appBar: !widget.showAppBar
          ? null
          : BaseAppBar(
              appBarTitle: widget.pageTitle.getValueOrDefault,
              isBackIcon: widget.showBackButton,
              isMoreVertIcon: widget.isShowMoreVertIcon,
              isSearchable: widget.isSearchable,
            ),
      body: Column(
        children: <Widget>[_buildBody()],
      ),
    );
  }

  Widget _buildBody() {
    if (widget.showCustomElevation) {
      return Expanded(
        child: Column(
          children: [
            Container(height: 5.h, color: context.greyText),
            Expanded(child: widget.child),
          ],
        ),
      );
    } else {
      return Expanded(child: widget.child);
    }
  }
}
