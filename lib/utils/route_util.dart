import 'package:flutter/material.dart';
import 'package:karmalab_assignment/views/splash/splash_view.dart';

class RouteUtil {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
