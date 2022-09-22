import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("home screen"),
      ),
    );
  }
}
