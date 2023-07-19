import 'package:flutter/material.dart';
import 'package:media_probe_app/feature/detail_screen/detail_screen.dart';
import 'package:media_probe_app/feature/home_screen/home_screen.dart';

class GlobalContextKey {
  static GlobalContextKey instance = GlobalContextKey._init();

  GlobalContextKey._init() {
    currentNavigatorKey = globalKey;
  }

  static final pageMaps = {
    0: <GlobalKey<NavigatorState>, Widget>{GlobalContextKey.instance.homeNavigatorKey: const HomeScreen()},
    1: <GlobalKey<NavigatorState>, Widget>{GlobalContextKey.instance.detailNavigatorKey: const DetailScreen()},
  };

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>(debugLabel: "globalKey");
  final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "homeNavigatorKey");
  final GlobalKey<NavigatorState> detailNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "detailNavigatorKey");
  //Navigation işlemlerinde bu Key kullanılmalı. Çünkü Navigation Stackleri ayrıştırıldı.
  //GlobalKey kullanılırsa hatalı navigationlar olabilir
  //TextStyle'ları vs çekmek için globalKey kullanılmaya devam edilebilir.
  late GlobalKey<NavigatorState> currentNavigatorKey;

  void changeCurrentNavigatorKey(GlobalKey<NavigatorState> key) {
    currentNavigatorKey = key;
  }
}
