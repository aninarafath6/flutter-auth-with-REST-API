import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/image_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/views/authentication/widget/auth_header.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';
import 'package:karmalab_assignment/widgets/custom_input.dart';

class NewPassWordView extends StatefulWidget {
  const NewPassWordView({Key? key}) : super(key: key);
  static const routeName = "/newPassword";

  @override
  State<NewPassWordView> createState() => _NewPassWordViewState();
}

class _NewPassWordViewState extends State<NewPassWordView> {
  bool isSecure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(
                AppImages.newPass,
                width: AppSizes.onboardingImageSize,
              ),
              const SizedBox(height: 50),
              const AuthHeader(
                title: "New Password",
                subTitle: "Enter new password",
              ),
              const SizedBox(height: 40),
              const CustomInputFelid(
                hint: "New password",
                lowerMargin: true,
              ),
              CustomInputFelid(
                hint: "Conform password",
                keyboardType: TextInputType.emailAddress,
                isPassWord: true,
                secure: isSecure,
                toggle: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
              ),
              const CustomButton(
                label: "Submit",
                // onTap: () => Navigator.pushNamed(
                //   context,
                //   VerificationView.routeName,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
