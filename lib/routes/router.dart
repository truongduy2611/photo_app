import 'package:flutter/material.dart';
import 'package:photo_app/routes/routes.dart';
import 'package:photo_app/screens/home/home.dart';
import 'package:photo_app/screens/splash/splash.dart';

class AppRouter {
  static const initialRoute = Routes.splash;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return createRoute(
          child: const HomePage(),
          fullscreenDialog: true,
        );
      case Routes.splash:
        return createRoute(
          child: const SplashPage(),
          fullscreenDialog: true,
        );
      default:
    }
  }

  static Route<dynamic> createRoute({
    required Widget child,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) {
    return MaterialPageRoute(
      builder: (context) => child,
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
    );
  }
}
