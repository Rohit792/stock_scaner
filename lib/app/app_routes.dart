import 'package:flutter/material.dart';
import 'package:stock_scan_parser/features/detail/presentation/detail_screen.dart';
import 'package:stock_scan_parser/features/error/error_screen.dart';
import 'package:stock_scan_parser/features/splash/presentation/pages/splash_screen.dart';

import '../features/home/presentation/pages/home_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    late Route<dynamic> pageRoute;

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        pageRoute = MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
        break;

      case HomeScreen.routeName:
        pageRoute = MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
        break;

      case DetailScreen.routeName:
        pageRoute = MaterialPageRoute(
          builder: (_) =>
              DetailScreen(stockElement: routeSettings.arguments as dynamic),
        );
        break;
    }
    return pageRoute;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (_) => const ErrorScreen());
  }
}
