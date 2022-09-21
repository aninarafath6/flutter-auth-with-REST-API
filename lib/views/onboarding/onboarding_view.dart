import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);
  static const routeName = "/onboarding";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("onbaording veiw"),
    ));
  }
}
