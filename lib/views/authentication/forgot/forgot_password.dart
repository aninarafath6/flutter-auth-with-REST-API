import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/image_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/views/authentication/widget/auth_header.dart';

class ForgotPassWord extends StatelessWidget {
  const ForgotPassWord({Key? key}) : super(key: key);
  static const routeName = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(AppSizes.defaultPadding),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 100),
            Image.asset(
              AppImages.forgotImage,
              width: AppSizes.onboardingImageSize,
            ),
            AuthHeader(
              title: "Forgot Password",
              subTitle: "Enter your email  address",
            )
          ],
        ),
      ),
    ));
  }
}
