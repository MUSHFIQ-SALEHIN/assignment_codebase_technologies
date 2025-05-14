import 'package:codebase_assignment/core/utils/logger.dart';
import 'package:codebase_assignment/features/errorScreens/no_internet.dart';
import 'package:codebase_assignment/features/landing/presentation/landing_screen.dart';
import 'package:flutter/material.dart';

abstract class RouteNames {
  RouteNames._();
  static const String landing = '/landing';
  static const String userDetails = '/userDetails';
  static const String noInternet='/noInternet';
}

abstract class AppNavigator {
  AppNavigator._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    AppLogger.i("Current Route==>> ${settings.name}");
    switch (settings.name) {
        case RouteNames.landing:
        return MaterialPageRoute(builder: (_) => LandingScreen());
        case RouteNames.userDetails:   
        return MaterialPageRoute(builder: (_) => UserDetailsScreen());
        case RouteNames.noInternet:
        return MaterialPageRoute(builder: (_) => NoInternetScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
