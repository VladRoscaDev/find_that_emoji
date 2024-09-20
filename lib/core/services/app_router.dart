import 'package:find_that_emoji/core/features/game/normal_game.dart';
import 'package:find_that_emoji/core/features/game_mode/game_mode.dart';
import 'package:find_that_emoji/core/features/menu/menu_page.dart';
import 'package:find_that_emoji/core/features/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashPage.routeName:
        return getRoute(const SplashPage());
      case MenuPage.routeName:
        return getRoute(const MenuPage());
      case GameMode.routeName:
        return getRoute(const GameMode());
      case NormalGame.routeName:
        return getRoute(const NormalGame());
      default:
        return null;
    }
  }

  MaterialPageRoute<dynamic> getRoute(Widget page) {
    return MaterialPageRoute<dynamic>(builder: (_) => page);
  }
}
