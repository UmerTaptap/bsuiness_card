import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'font_manager.dart';  // Assuming AppColors is in a separate file

class AppTextStyles {
  // Regular font size
  static const double bodyFontSize = 16.0;
  static const double titleFontSize = 20.0;
  static const double headlineFontSize = 24.0;
  static const double smallFontSize = 12.0;

  // Light Theme Text Styles
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: headlineFontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.black100, // Uses black for text in light theme
    ),
    displayMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: titleFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.black100,
    ),
    displaySmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.black80,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: headlineFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.black100,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: titleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.black80,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.black60,
    ),
    titleLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.black100,
    ),
    titleMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.black80,
    ),
    titleSmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: smallFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.black60,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.black100,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.black80,
    ),
    bodySmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: smallFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.black60,
    ),
    labelLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.black100,
    ),
    labelMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.black80,
    ),
    labelSmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: smallFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.black60,
    ),
  );

  // Dark Theme Text Styles
  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: headlineFontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.white100, // Uses white for text in dark theme
    ),
    displayMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: titleFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.white100,
    ),
    displaySmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.white80,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: headlineFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.white100,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: titleFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white80,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.white60,
    ),
    titleLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.white100,
    ),
    titleMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.white80,
    ),
    titleSmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: smallFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white60,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.white100,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.white80,
    ),
    bodySmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: smallFontSize,
      fontWeight: FontWeight.normal,
      color: AppColors.white60,
    ),
    labelLarge: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.white100,
    ),
    labelMedium: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: bodyFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.white80,
    ),
    labelSmall: TextStyle(
      fontFamily: FontManager.montserrat,
      fontSize: smallFontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white60,
    ),
  );
}
