import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';
import 'package:karmalab_assignment/widgets/custom_input.dart';
import 'package:karmalab_assignment/widgets/fancy2_text.dart';
import 'package:remixicon/remixicon.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign In", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  "Sign In To Your Account",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 50),
                const CustomInputFelid(
                  hint: "Business Name",
                ),
                const CustomInputFelid(
                    hint: "Email", keyboardType: TextInputType.emailAddress),
                CustomInputFelid(
                  hint: "Password",
                  isPassWord: true,
                  secure: secure,
                  lowerMargin: true,
                  toggle: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                ),
                const Fancy2Text(
                  first: "Forgot password? ",
                  second: "Reset",
                ),
                const SizedBox(height: 32),
                const CustomButton(label: "Sign In"),
                const SizedBox(height: 15),
                const Fancy2Text(
                  first: "Don’t have an account? ",
                  second: " Sign Up",
                  isCenter: true,
                ),
                const SizedBox(height: 35),
                // const SizedBox(height: 10),
                Stack(
                  children: [
                    const Divider(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "   Or Sign In with    ",
                        style: GoogleFonts.openSans(
                          backgroundColor: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.smallText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                SocialMediaAuthArea()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaAuthArea extends StatelessWidget {
  SocialMediaAuthArea({
    Key? key,
  }) : super(key: key);
  final List<Map<String, dynamic>> _media = [
    {
      "bg": Colors.blueAccent,
      "icon": Remix.facebook_fill,
    },
    {
      "bg": Colors.green,
      "icon": Remix.google_fill,
    },
    {
      "bg": Colors.blue.shade400,
      "icon": Remix.twitter_fill,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            _media.length,
            (index) => CircleAvatar(
              backgroundColor: _media[index]["bg"],
              radius: 25,
              child:
                  Icon(_media[index]["icon"] as IconData, color: Colors.white),
            ),
          )),
    );
  }
}
