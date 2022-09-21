import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/controllers/onbaording_controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);
  static const routeName = "/onboarding";
  static final OnboardingController _onboardingController =
      Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var bgColor = _onboardingController
            .onboardingList[_onboardingController.selectedIndex].bgColor;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: bgColor!.withOpacity(.4),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: 0,
                              child: CircleAvatar(
                                radius: 150,
                                backgroundColor: bgColor,
                              ),
                            ),
                            Image.asset(
                              _onboardingController
                                  .onboardingList[index].imageURL!,
                              width: AppSizes.onboardingImageSize,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  onPageChanged: _onboardingController.onPageChanged,
                  itemCount: _onboardingController.onboardingList.length,
                ),
              ),
              const SizedBox(),
            ],
          ),
        );
      }),
    );
  }
}
