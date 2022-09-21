import 'package:flutter/material.dart';
import 'package:karmalab_assignment/theme/theme.dart';
import 'package:karmalab_assignment/utils/route_util.dart';
import 'package:karmalab_assignment/views/onboarding/onboarding_view.dart';
import 'package:karmalab_assignment/views/onboarding/widgets/onboarding_action.dart';
import 'package:karmalab_assignment/views/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn net',
      initialRoute: OnboardingView.routeName,
      onGenerateRoute: RouteUtil.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
    );
  }
}
