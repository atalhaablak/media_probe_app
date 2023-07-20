import 'package:flutter/cupertino.dart';
import 'package:media_probe_app/core/utils/route.dart';
import 'package:media_probe_app/feature/detail_screen/detail_screen.dart';
import 'package:media_probe_app/feature/detail_screen/model/detail_screen_arguments.dart';
import 'package:media_probe_app/feature/home_screen/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePageRoute:
      return CupertinoPageRoute(settings: settings, builder: (_) => const HomeScreen());
    case detailPageRoute:
      DetailScreenArguments arguments = settings.arguments as DetailScreenArguments;
      return CupertinoPageRoute(settings: settings, builder: (_) => DetailScreen(arguments: arguments));
    default:
      return CupertinoPageRoute(settings: settings, builder: (_) => const HomeScreen()); // TODO: Splash Screen
  }
}
