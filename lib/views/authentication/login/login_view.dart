import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/widgets/custom_input.dart';

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
                  toggle: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
