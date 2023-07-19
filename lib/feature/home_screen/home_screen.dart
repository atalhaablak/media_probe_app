import 'package:flutter/material.dart';
import 'package:media_probe_app/core/constant/app_bar_titles.dart';
import 'package:media_probe_app/core/init/injection.dart';
import 'package:media_probe_app/core/keys/global_key.dart';
import 'package:media_probe_app/core/ui/widget/base_app_bar.dart';
import 'package:media_probe_app/core/ui/widget/drawer_widget.dart';
import 'package:media_probe_app/core/utils/screen_size.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';
import 'package:media_probe_app/feature/home_screen/widget/articles_item_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>.value(
      value: HomeViewModel(),
      builder: (context, widget) {
        ScreenSize().screenSize = MediaQuery.of(context).size;
        return Scaffold(
          drawer: const BaseDrawer(),
          appBar: const BaseAppBar(
            appBarTitle: AppBarTitles.homePage,
            isMoreVertIcon: true,
            isSearchable: true,
          ),
          body: Column(
            children: const [
              ArticlesItemWidget(),
            ],
          ),
        );
      },
    );
  }
}
