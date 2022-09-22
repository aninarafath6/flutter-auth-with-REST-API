import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/controllers/sign_up_controller.dart';
import 'package:karmalab_assignment/utils/dimension.dart';
import 'package:karmalab_assignment/views/authentication/login/login_view.dart';
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
  final SignUpController _signUpController = SignUpController();
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
                  _signUpForm(_signUpController),
                  const SizedBox(height: 32),
                  CustomButton(
                    label: "Sign Up",
                    onTap: () {
                      var res = _signUpController.validate();
                      // print(res["status"]);
                      if (res["status"]) {
                        _signUpController.register();
                      } else {
                        Get.snackbar(
                          "Oops 😕",
                          res["message"],
                          margin: const EdgeInsets.all(20),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Fancy2Text(
                    first: "Already have an account? ",
                    second: " Login",
                    isCenter: true,
                    onTap: () => Navigator.pushNamed(
                      context,
                      LoginView.routeName,
                    ),
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

  Column _signUpForm(SignUpController controller) {
    return Column(
      children: [
        CustomInputFelid(
          hint: "Business Name",
          controller: controller.nameTextController,
        ),
        CustomInputFelid(
          hint: "Email",
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        CustomInputFelid(
          hint: "Password",
          controller: controller.passwordController,
        ),
        CustomInputFelid(
          hint: "conform password",
          controller: controller.conformPasswordController,
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
