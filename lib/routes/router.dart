import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/screens/screens.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case HOME_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case DETAILS_SCREEN_ROUTE:
        return MaterialPageRoute(builder: (_) => DetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
    }
  }
}
