import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';

class CustomTextTheme {
  static TextStyle titleSmall() {
    return GoogleFonts.openSans(
      fontSize: 16,
      color: AppColors.texty,
      fontWeight: FontWeight.w400,
    );
  }
}
