import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/constants/image_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/views/splash/widgets/overlay_bg.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  static const String routeName = "/splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> topAnimation;
  late Animation<double> bottomAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    topAnimation = Tween<double>(begin: 80, end: 30).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    bottomAnimation = Tween<double>(begin: 300, end: 140).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OverlayBg(
            bg: AppColors.lightYellow,
            left: -100,
            top: -30,
          ),
          OverlayBg(
            bg: AppColors.lightOrange,
            // right: 0,
            right: -2 * topAnimation.value,
            // right: 30,
            // top: 20,
          ),
          OverlayBg(
            bg: AppColors.lightGreen,
            left: 70,
            bottom: -30,
          ),
          OverlayBg(
            bg: AppColors.lightBlue,
            left: 28 - bottomAnimation.value,
            bottom: -100,
          ),
          Center(
            child: Container(
              width: 500,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Colors.white,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 70.0,
              sigmaY: 70.0,
            ),
            child: const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.logoLg,
              width: AppSizes.logoSize,
            ),
          ),
        ],
      ),
    );
  }
}