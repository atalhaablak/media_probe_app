import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_probe_app/core/keys/global_key.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';
import 'package:media_probe_app/core/utils/router.dart';
import 'package:media_probe_app/feature/home_screen/home_screen.dart';
import 'package:media_probe_app/core/init/injection.dart' as locator;

void main() {
  locator.init();
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
          navigatorKey: GlobalContextKey.instance.globalKey,
          color: context.baseBackgroundColor,
          title: 'Media Probe App',
          theme: ThemeData(),
          home: const HomeScreen(),
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}
