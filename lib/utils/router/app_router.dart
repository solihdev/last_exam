import 'package:flutter/material.dart';
import 'package:last_exam/ui/splash/splash_page.dart';

class RouteName {
  //splash pages
  static const splash = "splash";

  //tab box
  static const main = "main";
}

class AppRoutes {
  static Route generateRote(RouteSettings settings) {
    dynamic args = settings.arguments;

    switch (settings.name) {
      //splash pages
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
