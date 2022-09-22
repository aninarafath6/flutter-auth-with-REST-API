import 'package:flutter/material.dart';
import 'package:karmalab_assignment/services/auth_service.dart';

class SignUpController {
  final AuthService _authService = AuthService();

  // controllers
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();

  bool _loading = false;

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get conformPasswordController =>
      _conformPasswordController;
  bool get loading => _loading;

  // conform password
  Map<String, dynamic> validate() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text);

    if (_nameTextController.text == "" ||
        _emailController.text == "" ||
        passwordController.text == "" ||
        _conformPasswordController.text == "") {
      return {"status": false, "message": "please fill all given inputs !!"};
    } else {
      if (emailValid) {
        if (passwordController.text.length >= 8) {
          if (passwordController.text == conformPasswordController.text) {
            return {
              "status": true,
            };
          } else {
            return {"status": false, "message": "conform your password !!"};
          }
        } else {
          return {
            "status": false,
            "message": "password must be greater than 8 !!"
          };
        }
      } else {
        return {"status": false, "message": "Email is not valid !!"};
      }
    }
  }

// register

  Future<bool> register() async {
    // return true;
    if (validate()["status"]) {
      _loading = true;

      var response = await _authService.register(
        {
          "email": _emailController.text.toString(),
          "password": _passwordController.text.toString(),
        },
      );
      _loading = false;

      return true;
    } else {
      return false;
    }
  }
}
