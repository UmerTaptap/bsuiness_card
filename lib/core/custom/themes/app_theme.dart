import 'package:business_card_app/core/custom/themes/text_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'custom_colors.dart';
import 'font_manager.dart';

class AppThemes {

  BuildContext context;
  AppThemes(this.context);

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: FontManager.montserrat,
    textTheme: AppTextStyles.lightTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarLight,
      titleTextStyle: AppTextStyles.lightTextTheme.displayMedium,
      centerTitle: false,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: AppColors.black100),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white100,
      labelTextStyle: WidgetStateProperty.all(AppTextStyles.lightTextTheme.displaySmall),
    ),
    extensions: [
      CustomColors(
        chatBubbleColor: AppColors.black20,
      ),
    ],
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: AppTextStyles.lightTextTheme.bodySmall,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      suffixIconColor: AppColors.black100,
      prefixIconColor: AppColors.black100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryLight,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryLight,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryLight,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.black20,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.errorLight,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.errorLight,
          width: 2,
        ),
      ),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.white100,
        textStyle: AppTextStyles.lightTextTheme.titleMedium,
      )
    ),

  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: FontManager.montserrat,
    textTheme: AppTextStyles.darkTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarDark,
      titleTextStyle: AppTextStyles.darkTextTheme.displayMedium,
      centerTitle: false,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: AppColors.white100),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white20,
      labelTextStyle: WidgetStateProperty.all(AppTextStyles.darkTextTheme.displaySmall),
    ),
    extensions: [
      CustomColors(
        chatBubbleColor: AppColors.white80,
      ),
    ],
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: AppTextStyles.darkTextTheme.bodySmall,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      suffixIconColor: AppColors.white100,
      prefixIconColor: AppColors.white100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryDark,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryDark,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryDark,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.white80,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.errorDark,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.errorDark,
          width: 2,
        ),
      ),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.black100,
        textStyle: AppTextStyles.lightTextTheme.titleMedium,
      )
    ),
  );
}
