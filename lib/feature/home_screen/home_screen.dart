import 'package:flutter/material.dart';
import 'package:media_probe_app/feature/home_screen/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>.value(
      value: HomeViewModel(),
      builder: (context, homeViewModel) {
        return Container(color: Colors.white);
      },
    );
  }
}
