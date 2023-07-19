import 'package:flutter/material.dart';
import 'package:media_probe_app/core/keys/global_key.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalContextKey.instance.changeCurrentNavigatorKey(GlobalContextKey.instance.detailNavigatorKey);
    return Container();
  }
}
