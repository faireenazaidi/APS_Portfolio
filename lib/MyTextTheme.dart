import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'Colors.dart';




class MyTextTheme {

  static TextStyle veryLargeWB = GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 50,
      fontWeight: FontWeight.w900,
    letterSpacing: -2,
  );
  static TextStyle normalWB = GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.w900,
    letterSpacing: -1,
  );
  static TextStyle mediumPrimaryGold = GoogleFonts.montserrat(
    color: AppColors.primaryGold,
      fontSize: 20,
      fontWeight: FontWeight.w600,
  );
  static TextStyle normalMediumGray = GoogleFonts.montserrat(
    color: AppColors.mediumGray,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    height: 1.8,
  );
  static TextStyle dynamicPrimaryGold({
    required bool isPrimary,
    required double controllerValue,
  }) {
    return GoogleFonts.montserrat(
      color: isPrimary
          ? AppColors.backgroundDark
          : Color.lerp(AppColors.primaryGold, AppColors.backgroundDark, controllerValue),
      fontSize: 16,
      fontWeight: FontWeight.w800,
    );
  }

}


