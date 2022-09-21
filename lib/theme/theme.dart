import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/theme/text_theme.dart';

class AppTheme {
  const AppTheme();
  static ThemeData theme() {
    return ThemeData(
      textTheme: TextTheme(
        displaySmall: GoogleFonts.openSans(),
        titleSmall: CustomTextTheme.titleSmall(),
        titleLarge: CustomTextTheme.title(),
        displayMedium: CustomTextTheme.displayMedium(),
      ),
    );
  }
}
