import 'package:bookia_store/core/constant/app_fonts.dart';
import 'package:bookia_store/core/styles/colors.dart';
import 'package:bookia_store/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: AppFonts.dMSerif,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(color: AppColors.borderColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(60, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.body.copyWith(color: AppColors.greyColor),
      fillColor: AppColors.accentColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyColor,
      backgroundColor: Colors.transparent,
      selectedLabelStyle: TextStyles.caption2.copyWith(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      unselectedLabelStyle: TextStyles.caption2.copyWith(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      // text color
      onSurface: AppColors.darkColor,
    ),
  );

  static PinTheme get defaultPinTheme => PinTheme(
    width: 56,
    height: 60,
    textStyle: TextStyles.title.copyWith(
      color: AppColors.darkColor,
      fontWeight: FontWeight.w700,
    ),
    decoration: BoxDecoration(
      color: AppColors.accentColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.borderColor),
    ),
  );

  static PinTheme get focusedPinTheme => defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      color: AppColors.backgroundColor,
      border: Border.all(color: AppColors.primaryColor, width: 1.5),
    ),
  );
}
