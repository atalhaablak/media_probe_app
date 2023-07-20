import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/core/ui/widget/base_app_bar.dart';
import 'package:media_probe_app/core/ui/widget/base_inkwell.dart';

class BaseScreen extends StatefulWidget {
  final String? pageTitle;
  final Widget child;
  final Widget? appBarLeading;
  final List<Widget>? actions;
  final bool showBackButton;
  final Stream<bool>? isOverlayLoadingStream;
  final bool showAppBar;
  final Widget? pageTitleWidget;
  final Widget? backButtonIcon;
  final VoidCallback? onInit;
  final VoidCallback? onDispose;
  final VoidCallback? retryOnPressed;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? centerTitle;
  final bool? resizeToAvoidBottomInset;
  final Color? scaffoldBackgroundColor;
  final double? titleSpacing;
  final Widget? bottomSheet;
  final Widget? drawer;
  final bool checkNetwork;
  final Color? appBarColor;
  final bool? showElevation;
  //FirebaseAnalytics tarafında doğru sayfayı yazabilmek için kullanılıyor
  final String screenName;
  final bool automaticallyImplyLeading;
  final bool showCustomElevation;
  final void Function()? onTap;
  final double? toolbarHeight;
  final bool isShowMoreVertIcon;
  final bool isSearchable;

  const BaseScreen({
    Key? key,
    this.pageTitle = "",
    required this.child,
    this.appBarLeading,
    this.showBackButton = true,
    this.actions,
    this.isOverlayLoadingStream,
    this.showAppBar = true,
    this.pageTitleWidget,
    this.onInit,
    this.onDispose,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.centerTitle,
    this.titleSpacing,
    this.appBarColor,
    this.backButtonIcon,
    this.scaffoldBackgroundColor,
    this.bottomSheet,
    this.drawer,
    this.checkNetwork = true,
    this.retryOnPressed,
    required this.screenName,
    this.showElevation,
    this.onTap,
    this.toolbarHeight,
    this.automaticallyImplyLeading = true,
    this.resizeToAvoidBottomInset,
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
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      drawer: widget.drawer,
      backgroundColor: widget.scaffoldBackgroundColor ?? context.white,
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
