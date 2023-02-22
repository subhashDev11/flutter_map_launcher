
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_today/presentation/screen/splash_screen.dart';

import '../utils/locator.dart';
import 'navigation_service.dart';
import 'route_names.dart';

class AppRouter {

  AppRouter();

  late final GoRouter appRouter = GoRouter(
    navigatorKey: getIt<NavigationService>().navigatorKey,
    errorBuilder: (context, state) => Scaffold(
        body: Center(
            child: Text(state.error.toString(),
            ),
        ),
    ),
    routes: [
      GoRoute(
        path: '/',
        name: RouteName.splash,
        builder: (_, state) {
          return const SplashScreen();
        },
      ),
    ]
  );
}
