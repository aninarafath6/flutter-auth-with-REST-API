import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/controllers/onbaording_controller.dart';

class OnboardingAction extends StatelessWidget {
  const OnboardingAction({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  static final OnboardingController _onboardingController =
      Get.put(OnboardingController());

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    var selectedIndex = _onboardingController.selectedIndex;

    var color = _onboardingController.onboardingList[selectedIndex].bgColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: List.generate(
                itemCount,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: selectedIndex == index ? 20 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? AppColors.dark
                          : AppColors.grey,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  );
                },
              ),
            ),
          ),
          AnimatedButton(selectedIndex: selectedIndex, color: color)
        ],
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
    required this.selectedIndex,
    required this.color,
  }) : super(key: key);

  final int selectedIndex;
  final Color? color;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  // late AnimationController _animationController;
  final OnboardingController _onboardingController =
      Get.put(OnboardingController());
  late Animation<double> animation;
  @override
  void initState() {
    _onboardingController.setAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    animation = CurvedAnimation(
        parent: _onboardingController.animationController,
        curve: Curves.easeInOut);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInCubic,
      duration: const Duration(milliseconds: 200),
      width: widget.selectedIndex == 2 ? 160 : 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius:
            BorderRadius.circular(widget.selectedIndex == 2 ? 15 : 30),
      ),
      child: widget.selectedIndex == 2
          ? Opacity(
              opacity: animation.value,
              child: Center(
                child: SizeTransition(
                  axisAlignment: 5,
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  child: Center(
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: widget.color),
                    ),
                  ),
                ),
              ),
            )
          : Icon(
              Icons.arrow_forward_rounded,
              size: 35,
              color: widget.color,
            ),
    );
  }
}
