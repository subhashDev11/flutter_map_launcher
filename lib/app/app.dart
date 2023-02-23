import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:test_today/core/route/route_generator.dart';
import 'package:test_today/core/theme/theme.dart';
import 'package:test_today/core/utils/logger_utils.dart';
import 'package:test_today/flavors.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      AppLogger.i("Application State => resumed");
    } else if (state == AppLifecycleState.detached) {
      AppLogger.i("Application State => detached");
    } else if (state == AppLifecycleState.inactive) {
      AppLogger.i("Application State => inactive");
    } else if (state == AppLifecycleState.paused) {
      AppLogger.i("Application State => paused");
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp.router(
          title: Flavors.title,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter().appRouter,
          theme: AppThemes.lightTheme,
          builder: (context, child) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
          ),
        );
      },
    );
  }
}
