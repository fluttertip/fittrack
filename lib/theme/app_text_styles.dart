import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Global Style Reuse
  static TextStyle heading = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle subheading = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryLight.withOpacity(0.6),
  );
}

class AppTextStyle {
  TextTheme get lightTextTheme => TextTheme(
        displayLarge: GoogleFonts.poppins(
            fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
        titleLarge: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.textPrimaryLight),
        labelSmall: GoogleFonts.poppins(
            fontSize: 12, color: AppColors.textPrimaryLight.withOpacity(0.7)),
      );

  TextTheme get darkTextTheme => TextTheme(
        displayLarge: GoogleFonts.poppins(
            fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
        titleLarge: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.textPrimaryDark),
        labelSmall: GoogleFonts.poppins(
            fontSize: 12, color: AppColors.textPrimaryDark.withOpacity(0.7)),
      );
}
