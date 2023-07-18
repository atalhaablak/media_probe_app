import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_probe_app/feature/home_screen/home_screen.dart';

void main() {
  runApp(const MediaProbeApp());
}

class MediaProbeApp extends StatelessWidget {
  const MediaProbeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        }
        return MaterialApp(
          title: 'Media Probe App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
