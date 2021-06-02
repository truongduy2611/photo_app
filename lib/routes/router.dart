import 'package:flutter/material.dart';
import 'package:photo_app/routes/routes.dart';
import 'package:photo_app/screens/login/login.dart';
import 'package:photo_app/screens/logout/logout.dart';
import 'package:photo_app/screens/main_tab_bar/main_tab_bar.dart';
import 'package:photo_app/screens/not_found/not_found.dart';
import 'package:photo_app/screens/register/register.dart';
import 'package:photo_app/screens/splash/splash.dart';

class AppRouter {
  static const initialRoute = Routes.splash;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loggedInRoot:
        return createRoute(
          child: const MainTabBar(),
          fullscreenDialog: true,
        );

      case Routes.splash:
        return createRoute(
          child: const SplashPage(),
          fullscreenDialog: true,
        );

      case Routes.logout:
        return createRoute(
          child: const LogoutPage(),
          fullscreenDialog: true,
        );

      case Routes.login:
        return createRoute(
          child: const LoginPage(),
        );

      case Routes.register:
        return createRoute(
          child: const RegisterPage(),
        );

      default:
        return createRoute(
          child: const NotFoundPage(),
          fullscreenDialog: true,
        );
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
