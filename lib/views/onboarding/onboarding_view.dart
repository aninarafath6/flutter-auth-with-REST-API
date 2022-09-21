import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/controllers/onbaording_controller.dart';
import 'package:karmalab_assignment/models/onboarding_model.dart';
import 'package:karmalab_assignment/views/onboarding/widgets/onboarding_action.dart';
import 'package:karmalab_assignment/views/onboarding/widgets/onboarding_banner.dart';

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
        var itemCount = _onboardingController.onboardingList.length;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: bgColor!.withOpacity(.4),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      var item = _onboardingController.onboardingList[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OnboardingBanner(
                            bgColor: bgColor,
                            index: index,
                          ),
                          const SizedBox(height: 80),
                          _contentArea(item),
                        ],
                      );
                    },
                    onPageChanged: _onboardingController.onPageChanged,
                    itemCount: itemCount,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OnboardingAction(itemCount: itemCount),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Padding _contentArea(OnboardingModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title!,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            item.description!,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.texty,
            ),
          ),
        ],
      ),
    );
  }
}
