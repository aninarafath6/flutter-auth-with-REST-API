import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class DialogHelper {
  // error snackbar
  void showErrorDialog(
      {String? title = "Oops 🤔",
      String? description = "something went wrong"}) {
    Get.snackbar(
      title!,
      description!,
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
