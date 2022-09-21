import 'package:flutter/material.dart';
import 'package:karmalab_assignment/views/authentication/select_auth/select_auth_view.dart';
import 'package:karmalab_assignment/views/onboarding/onboarding_view.dart';
import 'package:karmalab_assignment/views/splash/splash_view.dart';

class RouteUtil {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case SelectAuthView.routeName:
        return MaterialPageRoute(builder: (context) => const SelectAuthView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
