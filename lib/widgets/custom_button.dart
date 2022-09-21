import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.label,
    this.isFilled = true,
    this.onTap,
  }) : super(key: key);
  final bool? isFilled;
  final String? label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => AppColors.orange.withOpacity(.1)),
        shadowColor:
            MaterialStateProperty.resolveWith((states) => AppColors.darkOrange),
        side: MaterialStateProperty.resolveWith(
          (states) => BorderSide(
              color: isFilled! ? AppColors.transparent : AppColors.darkOrange),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => isFilled! ? AppColors.darkOrange : AppColors.transparent,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: Center(
          child: Text(
            label!,
            style: GoogleFonts.openSans(
                color: isFilled! ? AppColors.white : AppColors.darkOrange,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
