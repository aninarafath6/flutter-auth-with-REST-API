import 'package:flutter/material.dart';
import 'package:karmalab_assignment/models/onboarding_model.dart';

class OnboardingController {
  final List<OnboardingModel> _onboardingList = [
    OnboardingModel(
      title: "Learn from Experts and Professionals",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
      imageURL: "assets/images/png/onboarding-images/onboarding-3.png",
      bgColor: const Color(0xffEBF4FF),
    ),
    OnboardingModel(
      title: "One to one doubt clearing sessions!",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. ",
      imageURL: "assets/images/png/onboarding-images/onboarding-2.png",
      bgColor: const Color(0xffFFDDDD),
    ),
    OnboardingModel(
      title: "Explore your new skills everyday!",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
      imageURL: "assets/images/png/onboarding-images/onboarding-1.png",
      bgColor: const Color(0xffE6FFD6),
    ),
  ];

  List<OnboardingModel> get onboardingList => _onboardingList;
}
