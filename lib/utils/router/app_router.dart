import 'package:flutter/material.dart';

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
        return MaterialPageRoute(builder: (_) => const Scaffold());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
