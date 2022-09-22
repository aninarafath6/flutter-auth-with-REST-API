import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/image_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/views/authentication/new_password/new_password.dart';
import 'package:karmalab_assignment/views/authentication/verification/widgets/otp_feild.dart';
import 'package:karmalab_assignment/views/authentication/widget/auth_header.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';
import 'package:karmalab_assignment/widgets/fancy2_text.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);
  static const routeName = "/verification-otp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  AppImages.verificationImage,
                  width: AppSizes.onboardingImageSize,
                ),
                const SizedBox(height: 25),
                const AuthHeader(
                  title: "Verification",
                  subTitle: "An OTP  has been send to your email",
                ),
                const SizedBox(height: 40),
                const OtpFelid(),
                const SizedBox(height: 50),
                CustomButton(
                  label: "Verify",
                  onTap: () => Navigator.of(context)
                      .pushNamed(NewPassWordView.routeName),
                ),
                const SizedBox(height: 15),
                const Fancy2Text(
                  first: "Didn’t received OTP? ",
                  second: " Resent",
                  isCenter: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
