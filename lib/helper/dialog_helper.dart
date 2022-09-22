import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class DialogHelper {
  // error snackbar
  static void showErrorDialog({
    String? title = "Oops 🤔",
    String? description,
  }) {
    Get.snackbar(
      title!,
      description ?? "something went wrong",
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
