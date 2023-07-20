import 'package:flutter/material.dart';
import 'package:media_probe_app/feature/detail_screen/detail_screen.dart';
import 'package:media_probe_app/feature/home_screen/home_screen.dart';

class GlobalContextKey {
  static GlobalContextKey instance = GlobalContextKey._init();

  GlobalContextKey._init();

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
}
