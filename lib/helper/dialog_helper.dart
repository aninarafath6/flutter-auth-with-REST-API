import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class DialogHelper {
  // error snackbar
  static void showErrorDialog({
    String? title = "Oops 🤔",
    String? description = "something went wrong",
  }) {
    Get.snackbar(
      title!,
      description ?? "sdfkslf",
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
