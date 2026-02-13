import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/routing/routes.dart';
import 'package:mvvm_flutter/features/gold/presentation/screens/widgets/gold_screen.dart';
import 'package:mvvm_flutter/features/silver/presentation/screens/widgets/silver_screen.dart';

import '../presentation/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
      case AppRoutes.goldScreen:
        return MaterialPageRoute(
          builder: (context) {
            return GoldScreen();
          },
        );
        case AppRoutes.silverScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SilverScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
