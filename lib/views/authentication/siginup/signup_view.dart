import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/utils/dimension.dart';
import 'package:karmalab_assignment/views/authentication/login/login_view.dart';
import 'package:karmalab_assignment/views/authentication/verification/verification_view.dart';
import 'package:karmalab_assignment/views/authentication/widget/auth_header.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';
import 'package:karmalab_assignment/widgets/custom_input.dart';
import 'package:karmalab_assignment/widgets/fancy2_text.dart';
import 'package:karmalab_assignment/widgets/social_media_log.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  static const routeName = '/sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.defaultPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.spacing(height: 5),
                  const AuthHeader(
                    subTitle: "Create an account",
                    title: "Sign Up",
                  ),
                  const SizedBox(height: 50),
                  _signUpForm(),
                  const SizedBox(height: 32),
                  CustomButton(
                    label: "Sign Up",
                    onTap: () => Navigator.pushNamed(
                        context, VerificationView.routeName),
                  ),
                  const SizedBox(height: 15),
                  Fancy2Text(
                    first: "Already have an account? ",
                    second: " Login",
                    isCenter: true,
                    onTap: () =>
                        Navigator.pushNamed(context, LoginView.routeName),
                  ),
                  const SizedBox(height: 50),
                  SocialMediaAuthArea(),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _signUpForm() {
    return Column(
      children: [
        const CustomInputFelid(
          hint: "Business Name",
        ),
        const CustomInputFelid(
            hint: "Email", keyboardType: TextInputType.emailAddress),
        const CustomInputFelid(
          hint: "Password",
        ),
        CustomInputFelid(
          hint: "conform password",
          isPassWord: true,
          secure: secure,
          lowerMargin: true,
          toggle: () {
            setState(() {
              secure = !secure;
            });
          },
        ),
      ],
    );
  }
}
