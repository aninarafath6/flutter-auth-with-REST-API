// import 'package:flutter/rendering.dart';
import 'dart:convert';

import 'package:karmalab_assignment/constants/network_constants.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/services/base/base_client.dart';
import 'package:karmalab_assignment/services/shared_pref_service.dart';

class AuthService extends BaseController {
  final SharedPrefService _prefService = SharedPrefService();

  final BaseClient _baseClient = BaseClient();

  Future<bool> register(dynamic object) async {
    var result = await _baseClient.post(
      NetworkConstants.registerAPI,
      object,
      header: {'Content-Type': "application/json"},
    ).catchError(handleError);

    if (result != null) {
      result = json.decode(result);
      _prefService.userLog(
        id: result["id"],
        email: result["email"],
        token: result["token"],
      );
      return true;
    } else {
      return false;
    }
  }

// !! login method
  Future<bool> login(dynamic object) async {
    var result = await _baseClient.post(
      NetworkConstants.loginAPI,
      object,
      header: {'Content-Type': "application/json"},
    ).catchError(handleError);

    if (result != null) {
      result = json.decode(result);
      _prefService.userLog(
        id: result["id"],
        email: result["email"],
        token: result["token"],
      );
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> logout() async {
  //   var result = await _baseClient.post(
  //     NetworkConstants.registerAPI,
  //     {},
  //     header: {'Content-Type': "application/json"},
  //   ).catchError(handleError);

  // }
}
