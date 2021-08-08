import 'package:flutter/widgets.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goback() {
    return navigatorKey.currentState!.pop();
  }

  Future<dynamic> popAndNavigateTo(String routeName) {
    return navigatorKey.currentState!.popAndPushNamed(routeName);
  }
}

NavigatorService navigatorService = NavigatorService();
