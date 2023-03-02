import 'package:flutter/material.dart';
import 'package:last_exam/ui/cards_provider/add_card_page.dart';
import 'package:last_exam/ui/cards_provider/cards_page.dart';
import 'package:last_exam/ui/splash/splash_page.dart';
import 'package:last_exam/ui/tab_box/tab_box.dart';

class RouteName {
  //splash pages
  static const splash = "splash";

  //tab box
  static const main = "main";
  static const cards="cards";
  static const addCard='addCard';
}

class AppRoutes {
  static Route generateRote(RouteSettings settings) {
    dynamic args = settings.arguments;

    switch (settings.name) {
      //splash pages
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.cards:
        return MaterialPageRoute(builder: (_) => const CardsPage());

      case RouteName.addCard:
        return MaterialPageRoute(builder: (_) => const AddCardPage());

      default:
        return MaterialPageRoute(builder: (_) => const TabBox());
    }
  }
}
